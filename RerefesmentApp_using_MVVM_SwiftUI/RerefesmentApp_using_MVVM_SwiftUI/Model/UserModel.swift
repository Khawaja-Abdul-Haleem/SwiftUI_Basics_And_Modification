//
//  UserModel.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 21/09/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let email: String
    let name: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
