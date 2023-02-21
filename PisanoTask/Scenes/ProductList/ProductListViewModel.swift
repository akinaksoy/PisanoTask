//
//  ProductListViewModel.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation

class ProductListViewModel {
    var productList : ProductList?
    var viewController : ProductListViewController?
    
    init(viewController : ProductListViewController) {
        self.viewController = viewController
        fetchProductList()
    }
    
    internal func fetchProductList() {
        ProductListManager.responseService(type: .list, method: .get) { products, error in
            if let products = products {
                self.productList = products
                self.viewController?.displayProductList()
            } else if let error = error {
                // Show Error Popup
            }
        }
    }
    
    internal func fetchProduct(index : Int) {
        if let productId = self.productList?.products[index].productID {
            ProductDetailManager.responseService(query: productId, type: .detail, method: .get) { product, error in
                if let product = product {
                    // Navigate Detail Page
                } else if let error = error {
                    // show error popup
                }
            }
        }
    }
    
}
