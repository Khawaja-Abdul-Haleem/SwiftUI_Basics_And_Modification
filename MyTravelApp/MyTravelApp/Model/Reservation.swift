//
//  Reservation.swift
//  MyTravelApp
//
//  Created by Khawaja Abdul Haleem on 17/08/2023.
//

import Foundation

struct Reservation: Decodable {
    let id: Int
    let hotelName,stayFrom, stayTo: String?
    let totalCost: Int?
}
