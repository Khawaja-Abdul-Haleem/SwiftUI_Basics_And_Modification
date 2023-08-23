//
//  ContentView.swift
//  MapView_using_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 23/08/2023.
//

import MapKit
import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var directions: [String] = []
    @State private var showDirections = false
    
    var body: some View {
        VStack {
            MapView(directions: $directions)
            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show directions")
            })
            .disabled(directions.isEmpty)
            .padding()
        }.sheet(isPresented: $showDirections, content: {
            VStack(spacing: 0) {
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color(UIColor.systemBlue))
                
                List(0..<self.directions.count, id: \.self) { i in
                    Text(self.directions[i]).padding()
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
