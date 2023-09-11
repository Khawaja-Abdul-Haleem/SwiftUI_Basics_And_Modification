//
//  CustomSheetView.swift
//  BottomSheet
//
//  Created by Khawaja Abdul Haleem on 11/09/2023.
//

import SwiftUI

struct CustomBottomSheet: View {
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Bottom Sheet is opened")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        
    }
}
