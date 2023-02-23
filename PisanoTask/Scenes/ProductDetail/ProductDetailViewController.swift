//
//  ProductDetailViewController.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import UIKit

class ProductDetailViewController: BaseViewController {

    // MARK: - UI Outlets
    var productImage = UIImageView.setImageView
    let productNameLabel = UILabel(text: "", fontSize: 24, fontColor: .textColor, fontTypes: .bold)
    let lineView = UIView.setLineView
    let priceValueLabel = UILabel(text: "", fontSize: 24, fontColor: .textColor, fontTypes: .deffault)
    lazy var selectKilogramView : SelectKilogramView = {
        let view = SelectKilogramView()
        
        view.minusButton.didTapButton = {
            self.didTappedMinusButton()
        }
        view.plusButton.didTapButton = {
            self.didTappedPlusButton()
        }
        return view
    }()
    let descriptionLabel = UILabel(text: Constants.descriptionText, fontSize: 16, fontColor: .textColor, fontTypes: .italic)
    lazy var addCartView : AddCartView = {
        let view = AddCartView()
        
        view.addToCartButton.didTapButton = {
            self.didTappedAddToCartButton()
        }
        return view
    }()
    var loadingView : LoadingView?
    
    // MARK: - Public Properties
    var viewModel : ProductDetailViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure(title: viewModel?.product?.name ?? "")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        closePage()
    }
    // MARK: - UI Configuration
    override func configure(title: String) {
        super.configure(title: title)
        
        view.addSubview(productImage)
        view.addSubview(productNameLabel)
        view.addSubview(lineView)
        view.addSubview(priceValueLabel)
        view.addSubview(selectKilogramView)
        view.addSubview(descriptionLabel)
        view.addSubview(addCartView)
        
        productImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
            make.left.right.equalToSuperview()
        }
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp_bottomMargin).offset(32)
            make.left.equalToSuperview().offset(16)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp_bottomMargin).offset(16)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        priceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp_bottomMargin).offset(8)
            make.right.equalToSuperview().inset(8)
        }
        selectKilogramView.snp.makeConstraints { make in
            make.top.equalTo(priceValueLabel.snp_bottomMargin).offset(16)
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(60)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.top.equalTo(selectKilogramView.snp_bottomMargin).offset(8)
        }
        addCartView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
// MARK: - User Actions
extension ProductDetailViewController : ProductDetailUserInteractions {
    
    func didTappedMinusButton() {
        viewModel?.decraseKilogram()
        updateViews()
    }
    
    func didTappedPlusButton() {
        viewModel?.increaseKilogram()
        updateViews()
    }
    
    func didTappedAddToCartButton() {
        guard let selectedKilogram = viewModel?.selectedKilogram,let totalPrice = viewModel?.totalPrice,let productName = viewModel?.product?.name else {return}
        let alert = UIAlertController(title: Constants.success, message: "You bought \(selectedKilogram) kilograms of \(productName) for $\(totalPrice)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ok, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
// MARK: - Data Storage
extension ProductDetailViewController : ProductDetailDataStorageLogic {
    func configureProductDatas(model: Product) {
        viewModel = ProductDetailViewModel(viewController: self)
        displayLoadingView()
        viewModel?.setProductModel(product: model)
    }
}
// MARK: - Display Logic
extension ProductDetailViewController : ProductDetailDisplayLogic {
    
    func displayPage(model: Product?) {
        guard let model = model else {return}
        viewModel?.fetchImage(imageId: model.productID, imageURL: model.image)
        productNameLabel.text = model.name
        priceValueLabel.text = "\(Constants.price) \(model.price) \(Constants.priceKilogramSymbol)"
        addCartView.configureDatas(totalKilogram: "1", totalPrice: "\(model.price)")
    }
    func displayImage(image: UIImage) {
        productImage.image = image
        removeLoadingView()
    }
    
    func updateViews() {
        guard let selectedKilogram = viewModel?.selectedKilogram,let totalPrice = viewModel?.totalPrice else {return}
        selectKilogramView.configureLabel(value: String(selectedKilogram))
        addCartView.configureDatas(totalKilogram: String(selectedKilogram), totalPrice: String(totalPrice))
    }
    
    func displayLoadingView() {
        loadingView = LoadingView()
        guard let loadingView = loadingView else {return}
        productImage.addSubview(loadingView)
        loadingView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func removeLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    func closePage() {
        viewModel = nil
    }
}
