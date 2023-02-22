//
//  EmptyView.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 22.02.2023.
//

import UIKit

class EmptyView: UIView {

    let warningLabel = UILabel(text: RequestError.ErrorTypes.SomethingWentWrong.rawValue, fontSize: 16, fontColor: .textColor, fontTypes: .bold)
    let tryAgainButton : ButtonView = {
       let button = ButtonView()
        button.configure(buttonText: Constants.tryAgain,icon: "wifi",type: .ButtonWithText)
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(warningLabel)
        self.addSubview(tryAgainButton)
        
        warningLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        tryAgainButton.snp.makeConstraints { make in
            make.top.equalTo(warningLabel.snp_bottomMargin).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
