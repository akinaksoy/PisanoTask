//
//  ProductDetailViewModel.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation
import UIKit

class ProductDetailViewModel {
    
    var product: Product?{
        didSet {
            viewController?.displayPage(model: product)
        }
    }
    
    var selectedKilogram : Int = 1 {
        didSet {
            guard let price = product?.price else {return}
            totalPrice = selectedKilogram * price
        }
    }
    
    var totalPrice : Int = 0
    
    weak var viewController : ProductDetailViewController?
    
    init(viewController : ProductDetailViewController) {
        self.viewController = viewController
    }
    
    func setProductModel(product : Product){
        self.product = product
        totalPrice = selectedKilogram * product.price
    }
    
    func fetchImage(imageId : String, imageURL : String) {
        ImageManager.shared.fetchImage(imageId: imageId, imageUrl: imageURL) { image in
            if let image = image {
                self.viewController?.displayImage(image: image)
            }
        }
    }
    
    func decraseKilogram() {
        if selectedKilogram > 1 {
            selectedKilogram -= 1
        } else {
            selectedKilogram = 1
        }
    }
    
    func increaseKilogram() {
        if selectedKilogram < 100 {
            selectedKilogram += 1
        } else {
            selectedKilogram = 100
        }
    }
    
    
}
