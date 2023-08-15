//
//  ContentView.swift
//  bindingPropertyWrapper
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn : Bool = false
    
    var body: some View {
        VStack {
            Text("BindingWrapper Demo")
                .font(.title)
                .foregroundColor(isOn ? .blue : .gray)
            
            Text("By KAH")
                .font(.title3)
                .foregroundColor(.gray)
            
            ToggleView(isOn: $isOn)
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
