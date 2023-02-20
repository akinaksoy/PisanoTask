//
//  ProductListManager.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation
import Alamofire

public class ProductListManager {
    
    class func responseService(type : NetworkConstants.Pages,
                               method: HTTPMethod,
                               encoding: ParameterEncoding = URLEncoding.default,
                               completion: @escaping (ProductList?,RequestError.ErrorTypes?) -> Void){
        let baseURL = NetworkConstants.baseUrl
        let pageType = type.rawValue
        guard let url = URL(string: baseURL+pageType) else {
            completion(nil, .SomethingWentWrong)
            return
        }
        
        ApiService.ApiRequest(url, method: method, encoding: encoding) { responseData in
            if let statusCode = responseData.response?.statusCode {
                switch statusCode {
                case 200:
                    if let response = responseData.data {
                        let productList = try? JSONDecoder().decode(ProductList.self, from: response)
                        completion(productList, nil)
                    }
                default :
                    completion(nil,.NetworkError)
                }
            }
        }
        
    }
}
