//
//  ProductDetailViewModel.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation

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
