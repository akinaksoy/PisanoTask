//
//  ProductDetailManager.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation
public class ProductDetailManager {
    
    class func responseService(query : String,
                               type : NetworkConstants.Pages,
                               method: NetworkConstants.HTTPMethods,
                               completion: @escaping (Product?,RequestError.ErrorTypes?) -> Void){
        let baseURL = NetworkConstants.baseUrl
        let queryKeyword = "/\(query)"
        let pageType = type.rawValue
        guard let url = URL(string: baseURL+queryKeyword+pageType) else {
            completion(nil, .SomethingWentWrong)
            return
        }
        // Get Data from API and convert to Model.
        ApiService.ApiRequest(url,method: .GET) { responseData in
            if let statusCode = responseData.response?.statusCode{
                switch statusCode {
                case 200:
                    if let response = responseData.data {
                        let product = try? JSONDecoder().decode(Product.self, from: response)
                        completion(product, nil)
                    }
                default :
                    completion(nil,.NetworkError)
                }
            }
        }
        
    }
}
