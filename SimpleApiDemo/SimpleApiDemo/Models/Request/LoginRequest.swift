 //
//  LoginRequest.swift
//  SimpleApiDemo
//
//  Created by Khawaja Abdul Haleem on 17/08/2023.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail, userPassword: String
}
