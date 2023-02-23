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
        if NetworkService.shared.networkConnection {
            ProductListManager.responseService(type: .list, method: .GET) { products, error in
                if let products = products {
                    self.productList = products
                    self.viewController?.displayProductList()
                } else if let error = error {
                    self.viewController?.displayErrorMessage(errorMessage: error.rawValue)
                }
            }
        } else {
            viewController?.displayErrorMessage(errorMessage: Constants.connectionProblem)
        }
        
    }
    
    internal func fetchProduct(index : Int) {
        if NetworkService.shared.networkConnection {
            if let productId = self.productList?.products[index].productID {
                ProductDetailManager.responseService(query: productId, type: .detail, method: .GET) { product, error in
                    if let product = product {
                        self.viewController?.navigateToProductDetailPage(model: product)
                    } else if let error = error {
                        self.viewController?.displayErrorMessage(errorMessage: error.rawValue)
                    }
                }
            }
        } else {
            viewController?.displayErrorMessage(errorMessage: Constants.connectionProblem)
        }
    }
    
    func checkProductList() {
        if productList?.products.count ?? 0 < 1 {
            fetchProductList()
        }
    }
    
}
