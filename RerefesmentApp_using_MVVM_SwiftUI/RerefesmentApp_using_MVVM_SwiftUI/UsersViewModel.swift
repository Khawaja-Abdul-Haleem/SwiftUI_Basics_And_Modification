//
//  UsersViewModel.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 21/09/2023.
//

import Foundation
import Combine

final class UsersViewModel: ObservableObject {
    
    @Published var hasError = false
    @Published var error: CustomError?
    
    @Published var users: [User] = []
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable>()
    
    func fetchUsers() {
        
        hasError = false
        isRefreshing = true
        
        if let url = URL(string: Constants.getURL(path: .getUsers)) {
            
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    DispatchQueue.main.async {
                        
                        defer {
                            self?.isRefreshing = false
                        }
                        
                        if let error = error {
                            self?.hasError = true
                            self?.error = CustomError.custom(error: error)
                        } else {
                            
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase // Handle properties that look like first_name > firstName
                            
                            if let data = data,
                               let users = try? decoder.decode([User].self, from: data) {
                                self?.users = users
                            } else {
                                self?.hasError = true
                                self?.error = CustomError.failedToDecode
                            }
                        }
                    }
                }.resume()
        }
    }
    
    // using Combine
    func fetchUsersNew() {
        
        if let url = URL(string: Constants.getURL(path: .getUsers)) {
            
            isRefreshing = true
            hasError = false
            
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap({ res in
                    
                    guard let response = res.response as? HTTPURLResponse,
                          response.statusCode >= 200 && response.statusCode <= 299 else {
                        throw CustomError.invalidStatusCode
                    }
                    
                    let decoder = JSONDecoder()
                    guard let users = try? decoder.decode([User].self, from: res.data) else {
                        throw CustomError.failedToDecode
                    }
                    
                    return users
                })
                .sink { [weak self] res in
                    
                    defer { self?.isRefreshing = false }
                    
                    switch res {
                    case .failure(let error):
                        self?.hasError = true
                        self?.error = CustomError.custom(error: error)
                    default: break
                    }
                } receiveValue: { [weak self] users in
                    self?.users = users
                }
                .store(in: &bag)
        }
    }
}
