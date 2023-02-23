//
//  ProductListManager.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation

public class ProductListManager {
    
    class func responseService(type : NetworkConstants.Pages,
                               method: NetworkConstants.HTTPMethods,
                               completion: @escaping (ProductList?,RequestError.ErrorTypes?) -> Void){
        let baseURL = NetworkConstants.baseUrl
        let pageType = type.rawValue
        guard let url = URL(string: baseURL+pageType) else {
            completion(nil, .SomethingWentWrong)
            return
        }
        
        // Get Data from API and convert to Model.
        ApiService.ApiRequest(url, method: method) { responseData in
            if let statusCode = responseData.response?.statusCode {
                switch statusCode {
                case 200:
                    if let response = responseData.data {
                        do {
                            let productList = try JSONDecoder().decode(ProductList.self, from: response)
                            completion(productList, nil)
                        } catch {
                            completion(nil,.NetworkError)
                        }
                        
                    }
                default :
                    completion(nil,.NetworkError)
                }
            }
        }
        
    }
}
