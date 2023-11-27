//
//  PopularItemsRowVIew.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 15/09/2023.
//

import SwiftUI

struct PopularItemsRowVIew: View {
    @ObservedObject private var favoritesManager = FavoritesManager.shared
    @ObservedObject var item: Popular

    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 0) {
                Button(action: {
                    item.isSelected = !isSelected
                    favoritesManager.toggleFavorite(item)
                }, label: {
                    Image(favoritesManager.storedItems.contains(where: { $0.popular.id == item.id }) ? Constants.StringConstants.heartFilledImage : Constants.StringConstants.heartUnfilledImage)
                        .resizable()
                        .frame(width: 30, height: 30)
                })
                
                Spacer()
                
                Constants.getFlameIcon()
                    .font(.footnote)
                    .foregroundColor(.red)
                    .padding(8)
                    .background(Color.orange.opacity(0.1))
                    .clipShape(Circle())
            }
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getRect().width / 3)
                .padding(.top, 6)
            
            Text(item.title)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            Text(item.description)
                .font(.footnote)
                .foregroundColor(.gray)
            
            Constants.getPrice(price: Double(item.price))
                .fontWeight(.bold)
                .padding(.top, 8)
        }
        .padding(.horizontal, 30)
        .padding(.vertical)
        .background(.white)
        .cornerRadius(25)
        .shadow(color: .black.opacity(0.06), radius: 5, x: 5, y: 5)
    }
}

struct PopularItemsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
