//
//  SwiftUIView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 27/11/2023.
//

import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Constants.getBackButtonIcon()
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                Text("Bye")
            }
        }
    }
}
