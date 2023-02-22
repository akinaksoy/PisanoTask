//
//  AddCartView.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import UIKit

class AddCartView: UIView {
    // MARK: - UI Outlets
    let view : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.setColor(.alternativeColor)
        return view
    }()
    
    let totalKilogramLabel = UILabel(text: Constants.totalKilogram, fontSize: 16, fontColor: .textColor, fontTypes: .deffault)
    let kilogramValueLabel = UILabel(text: "1 KG", fontSize: 16, fontColor: .textColor, fontTypes: .bold)
    let priceLabel = UILabel(text: Constants.price, fontSize: 16, fontColor: .textColor, fontTypes: .deffault)
    let priceValueLabel = UILabel(text: "1 $", fontSize: 16, fontColor: .textColor, fontTypes: .bold)
   
    let addToCartButton : ButtonView = {
       let button = ButtonView()
        button.configure(buttonText: Constants.addToCart,icon: "cart.circle",type: .ButtonWithText)
       return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        
        self.addSubview(view)
        self.addSubview(totalKilogramLabel)
        self.addSubview(kilogramValueLabel)
        self.addSubview(priceLabel)
        self.addSubview(priceValueLabel)
        self.addSubview(addToCartButton)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        totalKilogramLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(16)
            make.width.equalToSuperview().dividedBy(4)
        }
        kilogramValueLabel.snp.makeConstraints { make in
            make.left.equalTo(totalKilogramLabel.snp_rightMargin).offset(8)
            make.top.equalTo(totalKilogramLabel)
            make.width.equalToSuperview().dividedBy(4)
        }
        priceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.equalTo(totalKilogramLabel.snp_bottomMargin).offset(8)
            make.width.equalToSuperview().dividedBy(4)
        }
        priceValueLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLabel.snp_rightMargin).offset(8)
            make.top.equalTo(priceLabel)
            make.width.equalToSuperview().dividedBy(4)
        }
        addToCartButton.snp.makeConstraints { make in
            make.top.equalTo(totalKilogramLabel).offset(4)
            make.left.equalTo(priceValueLabel.snp_rightMargin).offset(16)
            make.right.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDatas(totalKilogram : String, totalPrice : String) {
        kilogramValueLabel.text = totalKilogram + " KG"
        priceValueLabel.text = totalPrice + " $"
    }
    
}
