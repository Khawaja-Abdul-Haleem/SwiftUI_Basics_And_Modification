//
//  TWMediumView.swift
//  MyTravelWidgetExtension
//
//  Created by Khawaja Abdul Haleem on 17/08/2023.
//

import SwiftUI
import WidgetKit

struct TWMediumView: View {
    private var travel: [Travel]
    init(_travel: [Travel]) {
        self.travel = _travel
    }

    var body: some View {
        VStack(alignment:.leading){
            Text("Upcoming trips")
                .font(Font.headline)
                .foregroundColor(Color.primary)

            ForEach(travel, id: \.id){ item in
                HStack{
                    RoundedRectangle(cornerRadius: 1)
                        .fill(item.reservation != nil ? Color.green : Color.red)
                        .frame(width: 2, height: 20)
                    Text(item.destination!).font(.callout)
                    Spacer()
                    Text(item.date!).font(.subheadline)
                        .foregroundColor(Color.secondary)

                }
                Divider()
            }

        }.padding()
    }
}

struct TWMediumView_Previews: PreviewProvider {
    static var previews: some View {
        TWMediumView(_travel: [Travel(id: 1, destination: "Mumbai", travelby: "Airplane", date: "17-Aug-2023", reservation: Reservation(id: 12, hotelName: "KAH hotel", stayFrom: "17-Aug-2023", stayTo: "10-Sept-2023", totalCost: 16000))])
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
