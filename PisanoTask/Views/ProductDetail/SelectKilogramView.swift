//
//  SelectKilogramView.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import UIKit

class SelectKilogramView : UIView {
    let view : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.setColor(.alternativeColor)
        view.layer.cornerRadius = 16
        return view
    }()
    
    let valueLabel = UILabel(text: "1 Kilogram", fontSize: 16, fontColor: .textColor, fontTypes: .deffault)
    
    let minusButton : ButtonView = {
       let button = ButtonView()
        button.configure(buttonText: "",icon: "minus",type: .ButtonWithoutText)
       return button
    }()
    
    let plusButton : ButtonView = {
       let button = ButtonView()
        button.configure(buttonText: "",icon: "plus",type: .ButtonWithoutText)
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(view)
        self.addSubview(minusButton)
        self.addSubview(valueLabel)
        self.addSubview(plusButton)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        minusButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.width.height.equalTo(32)
            make.centerY.equalToSuperview()
        }
        plusButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(8)
            make.width.height.equalTo(32)
            make.centerY.equalToSuperview()
        }
        valueLabel.snp.makeConstraints { make in
            make.left.equalTo(minusButton.snp.rightMargin).offset(8)
            make.right.equalTo(plusButton.snp.leftMargin).inset(8)
            make.centerY.equalToSuperview()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel(value : String) {
        valueLabel.text = value + " Kilogram"
    }
    
}
