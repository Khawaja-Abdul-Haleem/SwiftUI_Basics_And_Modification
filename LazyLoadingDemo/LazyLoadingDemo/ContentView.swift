//
//  ContentView.swift
//  LazyLoadingDemo
//
//  Created by Khawaja Abdul Haleem on 18/08/2023.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var animalViewModel = AnimalViewModel()

    var body: some View {
        List(animalViewModel.animals, id:\.id){ animal in
            HStack{
               LazyImage(imageUrl: animal.image)

                Text(animal.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }.padding()
        }.onAppear(perform: {
            animalViewModel.getAnimal()
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
