//
//  CartView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 23/11/2023.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var favoritesManager = FavoritesManager.shared
    @State private var isOrderSummaryPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    if favoritesManager.storedItems.isEmpty {
                        Color.clear /// Add a clear background to the ScrollView
                    } else {
                        VStack(spacing: 16) {
                            ForEach(favoritesManager.storedItems, id: \.id) { item in
                                CartItemView(item: item)
                            }
                        }
                        .padding()
                    }
                }
                
                if favoritesManager.storedItems.isEmpty {
                    VStack {
                        Spacer()
                        Text(Constants.noRecordFound)
                            .foregroundColor(.gray)
                            .padding()
                            .font(.headline)
                        Spacer()
                    }
                }
            }
            .background(Color.white)
            .overlay(
                VStack {
                    HStack {
                        Text("Total Price: \(Constants.getPrice(price: favoritesManager.totalPrice))")
                            .fontWeight(.bold)
                            .padding()
                        
                        Spacer()
                        
                        Button(Constants.makeOrderButtonTitle) {
                            isOrderSummaryPresented.toggle()
                        }
                        .padding()
                        .background(favoritesManager.totalPrice > 0 ? Color.pink : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        .disabled(favoritesManager.totalPrice == 0)
                        .sheet(isPresented: $isOrderSummaryPresented) {
                            OrderSummaryView {
                                isOrderSummaryPresented = false
                            }
                        }
                    }
                    Spacer()
                }
                    .frame(maxHeight: 100)
                , alignment: .bottom /// Align the overlay to the bottom of the ZStack
            )
        }
    }
}

class Coordinator: ObservableObject {
    var onDismissSheet: (() -> Void)?
    
    init(onDismissSheet: @escaping () -> Void) {
        self.onDismissSheet = onDismissSheet
    }
}

