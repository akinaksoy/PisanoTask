//
//  UIView+EXTENSION.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import Foundation
import UIKit

extension UIView{
    
    static var setLineView : UIView {
        let lineView = UIView()
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        return lineView
    }
}



