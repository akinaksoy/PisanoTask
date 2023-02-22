//
//  LoadingView.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 22.02.2023.
//

import Foundation
import UIKit

class LoadingView : UIView {
    
    let indicatorView : UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(indicatorView)
        
        indicatorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        indicatorView.startAnimating()
    }
    
    deinit {
        indicatorView.stopAnimating()
        indicatorView.removeFromSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
