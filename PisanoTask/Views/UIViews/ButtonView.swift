//
//  ButtonView.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import UIKit

enum ButtonType {
    case ButtonWithText
    case ButtonWithoutText
}


class ButtonView: UIView {

    let buttonIcon : UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.tintColor = UIColor.setColor(.navigationBarColor)
        icon.image = UIImage(systemName: "cart.circle")
        return icon
    }()
    
    var buttonLabel = UILabel(text: "Add to Cart", fontSize: 16, fontColor: .alternativeColor, fontTypes: .bold)
    
    lazy var button : UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(didTappedButton), for: .touchUpInside)
        button.backgroundColor = UIColor.setColor(.navigationBarColor)
        button.layer.cornerRadius = 16
        return button
    }()
    
    var didTapButton: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(button)
        self.addSubview(buttonIcon)
        self.addSubview(buttonLabel)
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        buttonIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.height.width.equalTo(24)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func configure(buttonText : String,icon : String,type : ButtonType) {
        buttonLabel.text = buttonText
        buttonIcon.image = UIImage(systemName: icon)
        
        button.backgroundColor = UIColor.setColor(.navigationBarColor)
        buttonLabel.textColor = UIColor.setColor(.alternativeColor)
        buttonIcon.tintColor = UIColor.setColor(.alternativeColor)
        
        switch type {
        case .ButtonWithText:
            buttonLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalTo(buttonIcon.snp_rightMargin).offset(16)
            }
        case .ButtonWithoutText:
            buttonLabel.removeFromSuperview()
            buttonIcon.snp.remakeConstraints { make in
                make.centerY.centerX.equalToSuperview()
                make.height.width.equalTo(24)
            }
        }
       
        
    }
    
    
    @objc func didTappedButton() {
        if let didTapButton = didTapButton {
            didTapButton()
        }
    }
    
}
