//
//  SearchView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 24/10/2023.
//

import SwiftUI

struct SearchView: View {
    private var listOfCountry = Constants.StringConstants.countryList
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries, id: \.self) { country in
                    HStack {
                        Text(country.capitalized)
                        Spacer()
                        Constants.getMenWalkIcon()
                            .foregroundColor(Color.pink.opacity(0.8))
                    }
                    .padding()
                }
            }
            .searchable(text: $searchText)
            .navigationTitle(Constants.countryNavTitle)
        }
    }
    
    /// Filter countries
    var countries: [String] {
        /// Make countries lowercased
        let lcCountries = listOfCountry.map { $0.lowercased() }
        
        return searchText == "" ? lcCountries : lcCountries.filter { $0.contains(searchText.lowercased()) }
    }
}

#Preview {
    SearchView()
}
