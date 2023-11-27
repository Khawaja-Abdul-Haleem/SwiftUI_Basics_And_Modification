//
//  CommentsViewModel.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 18/10/2023.
//

import Foundation
import Combine

final class CommentsViewModel: ObservableObject {
    
    @Published var hasError = false
    @Published var error: CustomError?
    
    @Published var comments: [Comment] = []
    @Published private(set) var isRefreshing = false
    
    private var bag = Set<AnyCancellable>()
    
    func fetchCommnts() {
        
        if let url = URL(string: Constants.getURL(path: .getComments)) {
            
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
                    guard let comments = try? decoder.decode([Comment].self, from: res.data) else {
                        throw CustomError.failedToDecode
                    }
                    
                    return comments
                })
                .sink { [weak self] res in
                    
                    defer { self?.isRefreshing = false }
                    
                    switch res {
                    case .failure(let error):
                        self?.hasError = true
                        self?.error = CustomError.custom(error: error)
                    default: break
                    }
                } receiveValue: { [weak self] comment in
                    self?.comments = comment
                }
                .store(in: &bag)
        }
    }
}
