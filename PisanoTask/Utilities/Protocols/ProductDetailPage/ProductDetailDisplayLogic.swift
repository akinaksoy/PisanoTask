//
//  ProductDetailDisplayLogic.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 23.02.2023.
//

import UIKit

protocol ProductDetailDisplayLogic {
    func displayPage(model : Product?)
    func displayImage(image : UIImage)
    func displayLoadingView()
    func updateViews()
    func closePage()
    func removeLoadingView()
}
