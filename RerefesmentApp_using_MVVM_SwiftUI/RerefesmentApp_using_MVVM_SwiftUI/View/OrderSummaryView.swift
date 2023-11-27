//
//  OrderSummaryView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 23/11/2023.
//

import SwiftUI

struct OrderSummaryView: View {
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    var onOrderConfirmed: () -> Void
    @State private var showingAlert = false
    
    init(onOrderConfirmed: @escaping () -> Void) {
        self.onOrderConfirmed = onOrderConfirmed
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(favoritesManager.storedItems) { item in
                    Text("\(item.popular.title) - Quantity: \(item.quantity)")
                }
            }
            
            Spacer()
            
            HStack {
                Text("Total Price: \(Constants.getPrice(price: favoritesManager.totalPrice))")
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
                
                Button(Constants.confirmOrderButtonTitle) {
                    /// Add logic to handle the order confirmation
                    showingAlert = true
                }
                .alert("Order Confirmed", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {
                        onOrderConfirmed()
                    }
                } message: {
                    Text(Constants.orderConfirmSuccessMessage)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }
        .navigationBarTitle("Order Summary")
    }
}
