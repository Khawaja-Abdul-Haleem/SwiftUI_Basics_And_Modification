//
//  SearchBarView.swift
//  UISearchBar using UIViewRepresentable
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
   
    typealias UIViewType = UISearchBar
   
    @Binding var searchBarText: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var searchBarValue : String
        
        init(text: Binding<String>) {
            _searchBarValue = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarValue = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $searchBarText)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        // default setting
        let searchBar = UISearchBar(frame: .zero)
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        // when need to update
        uiView.text = searchBarText
    }
    
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchBarText: .constant(""))
    }
}
