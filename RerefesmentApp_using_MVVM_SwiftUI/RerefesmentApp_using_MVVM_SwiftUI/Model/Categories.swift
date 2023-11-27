//
//  Categories.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 15/09/2023.
//

import Foundation

struct Category: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var categories = [
    Category(image: "burger", title: "Burger"),
    Category(image: "pizza", title: "Pizza"),
    Category(image: "wings", title: "Wings"),
    Category(image: "pasta", title: "Pasta")
]
