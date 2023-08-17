//
//  LoginResponse.swift
//  SimpleApiDemo
//
//  Khawaja Abdul Haleem on 17/08/2023.
//

import Foundation

struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let userName, email: String
    let userId: Int
}
