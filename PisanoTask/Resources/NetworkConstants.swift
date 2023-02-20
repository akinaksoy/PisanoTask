//
//  NetworkConstants.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation


struct NetworkConstants {
    
    static let baseUrl = "https://s3-eu-west-1.amazonaws.com/developer-application-test/cart"
    
    enum Pages : String{
        case list = "/list"
        case detail = "/detail"
    }
}

struct RequestError {
    
    enum ErrorTypes : String {
        case NetworkError = "Network Error. Please Try Again"
        case SomethingWentWrong = "Something went wrong. Please Try Again."
    }
    
}
