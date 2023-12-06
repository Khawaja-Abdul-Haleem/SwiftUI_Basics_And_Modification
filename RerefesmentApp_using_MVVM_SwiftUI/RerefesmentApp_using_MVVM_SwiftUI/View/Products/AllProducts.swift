//
//  AllProducts.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 27/11/2023.
//

import SwiftUI

struct AllProducts: View {
    var body: some View {
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 25) {
                    ForEach(popularItems) { item in
                        NavigationLink(destination: ProductDetail(item: item)) {
                            PopularItemsRowVIew(item: item)
                        }
                    }
                }
                .padding()
                .padding(.leading, 10)
            })
            .navigationTitle("All Products")
    }
}

struct AllProducts_Previews: PreviewProvider {
    static var previews: some View {
        AllProducts()
    }
}
