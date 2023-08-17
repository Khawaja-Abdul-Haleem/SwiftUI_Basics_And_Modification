//
//  Travel.swift
//  MyTravelApp
//
//  Created by Khawaja Abdul Haleem on 17/08/2023.
//

import Foundation

struct TravelResponse : Decodable
{
    let result: [Travel]?
}

struct Travel: Decodable{
    let id: Int
    let destination, travelby, date: String?
    let reservation: Reservation?
}
