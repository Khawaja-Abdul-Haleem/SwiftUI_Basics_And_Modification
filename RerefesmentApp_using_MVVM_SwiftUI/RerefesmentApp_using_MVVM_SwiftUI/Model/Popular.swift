//
//  Popular.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 15/09/2023.
//

import Foundation

class Popular: Hashable, Identifiable, Equatable, ObservableObject {
    var id: String = UUID().uuidString
    var title: String
    var image: String
    var description: String
    var price: Int
    var isSelected: Bool?
    var quantitiy: Int
    
    init(title: String, image: String, description: String, price: Int, quantity: Int) {
        self.title = title
        self.image = image
        self.description = description
        self.price = price
        self.quantitiy = quantity
    }
    
    static func == (lhs: Popular, rhs: Popular) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

var popularItems = [
    Popular(title: "Burger", image: "burger", description: "Speciall", price: 200, quantity: 0),
    Popular(title: "Pizza-Large", image: "pizza", description: "BBQ-Special flavor", price: 1500, quantity: 0),
    Popular(title: "Wings", image: "wings", description: "Chicken Wings", price: 800, quantity: 0),
    Popular(title: "Pasta", image: "pasta", description: "Special Pasta", price: 1000, quantity: 0)
]
