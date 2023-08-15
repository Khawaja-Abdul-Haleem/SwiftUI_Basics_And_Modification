//
//  ContentView.swift
//  EnvironmentalObjectDemo
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var user: User = User()
    @ObservedObject private var age: Age = Age()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("User name is: \(user.name)")
                    .font(.title2)
                
                TextField("user", text: $user.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                NavigationLink("Navigate to secondView", destination: SecondView())
            }
            .padding()
            .navigationTitle("Environment Object")
        }
        .environmentObject(user)
        .environmentObject(age)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
