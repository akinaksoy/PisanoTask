//
//  ImageManager.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 22.02.2023.
//

import Foundation
import UIKit
import Kingfisher

class ImageManager {
    static let shared = ImageManager()
    
    private let cache = NSCache<NSString,UIImage>()
    
    func fetchImage(imageId : String,imageUrl : String, completion: @escaping (UIImage?) -> Void) {
        var imageView = UIImage()
        
        if let imageView = cache.object(forKey: imageId as NSString) {
            completion(imageView)
            return
        }
        
        DispatchQueue.main.async {
            guard let imageURL = URL.init(string: imageUrl) else {
                completion(nil)
                return
            }
            
            let resource = ImageResource(downloadURL: imageURL)
            KingfisherManager.shared.retrieveImage(with: resource) { result in
                switch result {
                case .success(let image) :
                    imageView = image.image
                    self.cache.setObject(imageView, forKey: imageId as NSString)
                    completion(imageView)
                case .failure(_) :
                    completion(nil)
                }
            }
            
        }
    }
    
}
