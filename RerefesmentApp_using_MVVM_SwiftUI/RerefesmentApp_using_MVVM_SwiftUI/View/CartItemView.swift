//
//  CartItemView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 23/11/2023.
//

import SwiftUI

struct CartItemView: View {
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    var item: PopularWithQuantity

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(item.popular.title)
                .font(.headline)
                .padding(.top, 8)

            Text(item.popular.description)
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Text("Price: \(Constants.getPrice(price: Double(item.popular.price) * Double(item.quantity)))")
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Spacer()

                Stepper(value: Binding(
                    get: { self.favoritesManager.quantity(for: self.item.popular) },
                    set: { newValue in
                        self.favoritesManager.setQuantity(newValue, for: self.item.popular)
                    }
                )) {
                    Text("\(favoritesManager.quantity(for: item.popular))")
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 3)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .onChange(of: favoritesManager.totalPrice) { _ in
            /// Handle total price changes
            print("Total Price Updated: \(favoritesManager.totalPrice)")
        }
    }
}
