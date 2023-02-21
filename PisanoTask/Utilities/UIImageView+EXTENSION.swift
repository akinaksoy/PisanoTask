//
//  UIImageView+EXTENSION.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import Kingfisher
import UIKit

extension UIImageView{
    
    func setImage(imageUrl : String) {
        DispatchQueue.main.async {
            let imageURL = URL.init(string: imageUrl)
            KF.url(imageURL).set(to: self)
        }
    }
    
    static var setImageView : UIImageView {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.backgroundColor = .clear
        return imageView
    }
}
