//
//  ProductDetail.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 27/11/2023.
//

import SwiftUI

struct ProductDetail: View {
    let item: Popular
    var body: some View {
        
        VStack {
            Image(item.image)
        }
        .navigationBarTitle(item.title)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: NavigationBackButton()
        )
    }
}

#Preview {
    ProductDetail(item: Popular(title: "", image: "", description: "", price: 200, quantity: 1))
}

