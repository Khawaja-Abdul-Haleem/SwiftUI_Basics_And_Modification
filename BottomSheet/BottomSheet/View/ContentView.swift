//
//  ContentView.swift
//  BottomSheet
//
//  Created by Khawaja Abdul Haleem on 11/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showSheet = false
    
    var body: some View {
        Button("Open Sheet") {
            showSheet.toggle()
        }
        .font(.title).bold()
        .foregroundColor(.red)
        .sheet(isPresented: $showSheet) {
            CustomBottomSheet()
                .presentationDetents([.medium, .large, .fraction(0.20)])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


