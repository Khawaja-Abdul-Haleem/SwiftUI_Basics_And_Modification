//
//  SecondView.swift
//  EnvironmentalObjectDemo
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var age: Age
    
    var body: some View {
        VStack {
            Text("SecondView")
                .font(.title)
            
            Stepper("User Age \(age.userAge)", value: $age.userAge)
            
        NavigationLink("Navigate to third View", destination: ThirdView())
        }.padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(Age())
    }
}
