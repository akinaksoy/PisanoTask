//
//  ProductList.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import Foundation

// MARK: - ProductList
struct ProductList: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let productID, name: String
    let price: Int
    let image: String

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name, price, image
    }
}
