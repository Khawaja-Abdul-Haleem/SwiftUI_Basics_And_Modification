//
//  FavoritesManager.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 22/11/2023.
//

import Foundation

struct PopularWithQuantity: Identifiable {
    let id: UUID = UUID()
    let popular: Popular
    var quantity: Int
}

class FavoritesManager: ObservableObject {
    
    static var shared = FavoritesManager()
    
    init() {}
    
    @Published var storedItems: [PopularWithQuantity] = []
    @Published var totalPrice: Double = 0.0
    
    func toggleFavorite(_ item: Popular) {
        if let index = storedItems.firstIndex(where: { $0.popular.id == item.id }) {
            storedItems.remove(at: index)
        } else {
            storedItems.append(PopularWithQuantity(popular: item, quantity: 1))
        }
        updateTotalPrice()
    }
    
    func quantity(for item: Popular) -> Int {
        return storedItems.first(where: { $0.popular.id == item.id })?.quantity ?? 0
    }
    
    func setQuantity(_ quantity: Int, for item: Popular) {
        if let index = storedItems.firstIndex(where: { $0.popular.id == item.id }) {
            storedItems[index].quantity = quantity
            updateTotalPrice()
        }
    }
    
    private func updateTotalPrice() {
        totalPrice = storedItems.reduce(0.0) { $0 + (Double($1.popular.price) * Double($1.quantity)) }
    }
}
