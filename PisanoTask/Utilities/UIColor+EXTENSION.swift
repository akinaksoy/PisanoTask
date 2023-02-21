//
//  UIColor+EXTENSION.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import Foundation
import UIKit

extension UIColor {
    
    static func setColor(_ color : Constants.colorTypes) -> UIColor? {

        if let selectedColor = UIColor(named: color.rawValue) {
            return selectedColor
        } else {
            return nil
        }
    }
}
