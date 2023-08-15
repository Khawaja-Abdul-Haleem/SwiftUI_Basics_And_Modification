//
//  ContentView.swift
//  ObservableObjectDemo
//
//  Created by Khawaja Abdul Haleem on 11/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var user: User = User()
    
    var body: some View {
        VStack {
            Text("User name is: \(user.name)")
                .font(.title2)
            
            TextField("user", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
