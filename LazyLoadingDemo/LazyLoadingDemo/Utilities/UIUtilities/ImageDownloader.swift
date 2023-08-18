//
//  ImageDownloader.swift
//  LazyLoadingDemo
//
//  Created by Khawaja Abdul Haleem on 18/08/2023.
//

import Foundation
import UIKit

extension UIImage {
    func resizeImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))

        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

class ImageDownloader : ObservableObject {
    @Published var downloadedImage: UIImage?
    private let imagePath: URL

    init(imageUrl: String) {
        self.imagePath = URL(string: imageUrl)!
        getImage()
    }

    func getImage(){
        var urlRequest = URLRequest(url: self.imagePath)
        urlRequest.httpMethod = "get"
        URLSession.shared.dataTask(with: urlRequest) { [weak self] imageData, response, error in
            if(error == nil && imageData != nil){
                DispatchQueue.main.async {
                    let resizedImage = UIImage(data: imageData!)?.resizeImage(with: CGSize(width: 100, height: 100))
                    self?.downloadedImage = resizedImage
                }
            }
        }.resume()
    }
}
