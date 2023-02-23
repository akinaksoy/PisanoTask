//
//  ProductListPageDisplayLogic.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 23.02.2023.
//

import Foundation

protocol ProductListPageDisplayLogic {
    func displayProductList()
    func displayEmptyView()
    func displayLoadingView()
    func displayErrorMessage(errorMessage : String)
    func removeCollectionView()
    func removeEmptyView()
    func removeLoadingView()
}
