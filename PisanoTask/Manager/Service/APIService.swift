//
//  APIService.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation
class ApiService {
    
    class func ApiRequest(_ url: URL,
                          method: NetworkConstants.HTTPMethods,
                          completion: @escaping (RequestModel) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            DispatchQueue.main.async {
                let requestModel = RequestModel(data: data, response: httpResponse, error: error)
                completion(requestModel)
            }
        })
        
        task.resume()
    }
}
