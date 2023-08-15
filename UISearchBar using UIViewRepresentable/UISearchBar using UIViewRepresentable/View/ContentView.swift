//
//  ContentView.swift
//  UISearchBar using UIViewRepresentable
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchBarText: String = String()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchBarText: $searchBarText)
                List {
                    ForEach(employees.filter({searchBarText.isEmpty ? true : $0.name.contains(searchBarText)})) { employee in
                        Text(employee.name)
                    }
                }
            }
            .padding()
            .navigationTitle("Employees")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
