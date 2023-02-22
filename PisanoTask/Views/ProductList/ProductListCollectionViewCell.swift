//
//  ProductListCollectionViewCell.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import UIKit
import SnapKit


class ProductListCollectionViewCell: UICollectionViewCell {
    
    
    static let cellIdentifier = "ProductListCollectionViewCell"
    // MARK: - UI Outlet
    var productImage = UIImageView.setImageView
    let productNameLabel = UILabel(text: "", fontSize: 16, fontColor: .textColor, fontTypes: .deffault)
    let productPriceLabel = UILabel(text: "", fontSize: 12, fontColor: .textColor, fontTypes: .bold)
    var loadingIndicator : LoadingView?
    // MARK: - Init
    override init(frame : CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init(coder : NSCoder){
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    // MARK: - UI Configuration
    func setDesignCell() {
        self.backgroundColor = UIColor.setColor(.cellColor)
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }
    
    func configure() {
        setDesignCell()
        self.addSubview(productImage)
        self.addSubview(productNameLabel)
        self.addSubview(productPriceLabel)
        
        productImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(8)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp_bottomMargin).offset(16)
            make.left.right.equalTo(productImage)
        }
        
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp_bottomMargin).offset(8)
            make.left.right.equalTo(productNameLabel)
        }
    }
    
    func setDatas(model : Product) {
        productNameLabel.text = model.name
        productPriceLabel.text = "\(model.price) $ / KG"
        startImageLoading()
        ImageManager.shared.fetchImage(imageId: model.productID, imageUrl: model.image) { image in
            guard let image = image else {
                return
            }
            self.stopImageLoading()
            self.productImage.image = image
        }
    }
    
    func startImageLoading() {
        loadingIndicator = LoadingView()
        guard let loadingIndicator = loadingIndicator else {
            return
        }
        productImage.addSubview(loadingIndicator)
        
        loadingIndicator.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func stopImageLoading() {
        loadingIndicator?.removeFromSuperview()
        loadingIndicator = nil
    }
    
}
