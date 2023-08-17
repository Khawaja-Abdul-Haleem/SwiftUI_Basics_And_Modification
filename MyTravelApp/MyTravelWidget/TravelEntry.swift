//
//  TravelEntry.swift
//  MyTravelWidgetExtension
//
//  Created by Khawaja Abdul Haleem on 17/08/2023.
//

import WidgetKit

struct TravelEntry: TimelineEntry {
    let date: Date
    let travel : [Travel]

    static func mockTravelEntry() -> TravelEntry{
        return TravelEntry(date: Date(), travel: [Travel(id: 1, destination: "Mumbai", travelby: "Airplane", date: "17-Aug-2023", reservation: Reservation(id: 12, hotelName: "KAH hotel", stayFrom: "17-Aug-2023", stayTo: "10-Sept-2023", totalCost: 16000))])
    }

}
