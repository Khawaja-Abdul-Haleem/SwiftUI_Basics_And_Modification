//
//  MenuContent.swift
//  RerefesmentApp_using_MVVM_SwiftUI
//
//  Created by Khawaja Abdul Haleem on 18/09/2023.
//

import SwiftUI

struct MenuContent: View {
    @State private var MenuTabs = ["My Profile", "Posts", "Favourites", "Logout"]
    @State private var selectedRow: String?
   
    var body: some View {
        NavigationView {
            List(selection: $selectedRow) {
                ForEach(MenuTabs, id: \.self) { row in
                    Text(row)
                        .tag(row)
                        .listRowBackground(row == selectedRow ? Color.pink : nil)
                        .foregroundStyle(row == selectedRow ? Color.white: Color.black)
                }
            }
        }
    }
}
