//
//  Enums.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 22/09/2023.
//

import Foundation

enum ApiPath: String {
    case getUsers = "users"
    case getComments = "comments"
}

enum SelectedTabs: CaseIterable, Identifiable {
    case home
    case heart
    case bell
    case cart
    
    var id: String { return title }
    
    var title: String {
        get {
            switch self {
            case .home: return "home"
            case .heart: return "heart"
            case .bell: return "bell"
            case .cart: return "cart"
            }
        }
        set {
            switch self {
            case .home: self = .home
            case .heart: self = .heart
            case .bell: self = .bell
            case .cart: self = .cart
            }
        }
    }
}

enum CustomError: LocalizedError {
    case custom(error: Error)
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .failedToDecode:
            return "Failed to decode response"
        case .custom(let error):
            return error.localizedDescription
        case .invalidStatusCode:
            return "Request doesn't fall in the valid status code"
        }
    }
}
