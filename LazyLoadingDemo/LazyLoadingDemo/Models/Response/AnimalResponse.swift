//
//  AnimalResponse.swift
//  LazyLoadingDemo
//
//  Created by Khawaja Abdul Haleem on 18/08/2023.
//

import Foundation

struct AnimalResponse : Decodable {
    let errorMessage : String?
    let data: [Animal]
}

struct Animal : Decodable, Identifiable {
    var id = UUID()
    let name, image: String

    enum CodingKeys: String, CodingKey{
        case name
        case image
    }
}
