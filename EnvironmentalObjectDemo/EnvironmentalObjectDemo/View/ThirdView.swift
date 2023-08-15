//
//  ThirdView.swift
//  EnvironmentalObjectDemo
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var user: User
    @EnvironmentObject var age: Age
    
    
    var body: some View {
        VStack {
            Text("This is Third View")
                .padding()
            Text("Logged in User is: \(user.name)")
            Text("Age is: \(age.userAge)")
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
            .environmentObject(User())
            .environmentObject(Age())
    }
}
