//
//  UIImageView+EXTENSION.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import Kingfisher
import UIKit

extension UIImageView{
    
    static var setImageView : UIImageView {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .clear
        return imageView
    }
    
}
