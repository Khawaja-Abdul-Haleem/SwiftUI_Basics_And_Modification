//
//  ContentView.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 15/09/2023.
//

import SwiftUI
 
struct ContentView: View {
    
    // hiding tabBar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selectedCategory: Category = categories.first!
    @State var selectedTab: String = "home"
    
    var body: some View {
        /// tabView
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {

                switch selectedTab {
                case "home":
                    LandingPage(selectedCategory: $selectedCategory)
                        .tag("home")

                case "heart":
                    LoadUserView()
                    
                case "MangnifyingGlass":
                    SearchView()

                case "bell":
                    LoadCommentView()

                case "cart":
                    CartView()
                    
                default:
                    Color.yellow
                }
            }
            /// custom TabBar
            customtabBar(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
