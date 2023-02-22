//
//  APIService.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation
import Alamofire
class ApiService {
    
    class func ApiRequest(_ url: URL,
                          method: HTTPMethod,
                          encoding: ParameterEncoding = URLEncoding.default,
                          completion: @escaping (AFDataResponse<Data?>) -> Void) {
        
        AF.request(url,
                   method: method,
                   parameters: nil,
                   encoding: encoding,
                   headers: nil,
                   interceptor: nil) {$0.timeoutInterval = 2}
            .response { (responseData) in
            
            completion(responseData)
        }
    }
}
