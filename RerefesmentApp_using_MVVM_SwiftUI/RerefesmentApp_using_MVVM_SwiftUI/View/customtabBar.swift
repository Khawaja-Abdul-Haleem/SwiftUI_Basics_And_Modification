//
//  customtabBar.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 15/09/2023.
//

import SwiftUI

struct customtabBar: View {
    
    @Binding var selectedTab: String
    @State var selectedIndex = 0
    /// animation nameSpace for sliding effect
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0) {
            /// tabBar Button
            
            tabBarButton(animation: animation, image: "home", selectedTab: $selectedTab)
            tabBarButton(animation: animation, image: "heart", selectedTab: $selectedTab)
        
            Button(action: {
                selectedTab = "MangnifyingGlass"
            }, label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.pink)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: -5, y: -5)
            })
            .offset(y: -30)
            
            tabBarButton(animation: animation, image: "bell", selectedTab: $selectedTab)
            tabBarButton(animation: animation, image: "cart", selectedTab: $selectedTab)
        }
        .padding(.top)
        /// decreasing extra Padding
        .padding(.vertical, -10)
        .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        .background(.white)
    }
}

struct customtabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct tabBarButton: View {
    var animation: Namespace.ID
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        Button(action: {
            
            withAnimation(.spring()) {
                selectedTab = image
            }
            
        }, label: {
            
            VStack(spacing: 8) {
                Image(image)
                    .resizable()
                /// since its asset image
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == image ? .pink : .gray.opacity(0.5))
                
                if selectedTab == image {
                    Circle()
                        .fill(.pink)
                    /// sliding effect
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .frame(width: 8, height: 8)
                }
            }
            .frame(maxWidth: .infinity)
            
        })
    }
}


/// extending view to get Safe Area
extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
