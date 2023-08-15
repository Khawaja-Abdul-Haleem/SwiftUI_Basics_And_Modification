//
//  ToggleView.swift
//  bindingPropertyWrapper
//
//  Created by Khawaja Abdul Haleem on 15/08/2023.
//

import SwiftUI

struct ToggleView: View {
    
    @Binding var isOn : Bool
    
    var body: some View {
        
        VStack {
            
            Toggle(isOn: $isOn) {
                Text("Toggle is")
            }.fixedSize()
        }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView(isOn: .constant(false))
    }
}
