//
//  EmptyView.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 22.02.2023.
//

import UIKit

class EmptyView: UIView {

    let warningLabel = UILabel(text: RequestError.ErrorTypes.SomethingWentWrong.rawValue, fontSize: 16, fontColor: .textColor, fontTypes: .bold)
    let tryAgainButton = ButtonView()
    
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
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
