//
//  TravelResource.swift
//  MyTravelApp
//
//  Created by Khawaja Abdul Haleem on 17/08/2023.
//

import Foundation

protocol TravelResourceProtocol {
    func getTravelDetails(completionHandler: @escaping(_ result: TravelResponse?)-> Void)
}

struct TravelResource: TravelResourceProtocol{
    func getTravelDetails(completionHandler: @escaping (TravelResponse?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://demo0333988.mockable.io/getTravelDetails")!)) { (responseData, urlResponse, serverError) in

            if(serverError == nil)
            {
                do {
                    let result = try JSONDecoder().decode(TravelResponse.self, from: responseData!)
                    completionHandler(result)
                } catch  {
                    debugPrint(error)
                }
            }
        }.resume()
    }


}
