//
//  ViewController.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import UIKit

protocol ProductListPageDisplayLogic {
    func displayProductList()
    func displayErrorMessage()
}

class ProductListViewController: BaseViewController {

    private lazy var productCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width*0.48, height: view.bounds.height/5)
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .setColor(.backgroundColor)
        collectionView.register(ProductListCollectionViewCell.self,forCellWithReuseIdentifier: ProductListCollectionViewCell.cellIdentifier)
       return collectionView
    }()
    
    var viewModel : ProductListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProductListViewModel(viewController: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure(title: "Products")
    }
    
    override func configure(title: String) {
        super.configure(title: title)
        
        view.addSubview(productCollectionView)
        
        productCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension ProductListViewController : ProductListPageDisplayLogic {
    func displayProductList() {
        productCollectionView.reloadData()
    }
    
    func displayErrorMessage() {
        // alertView
    }
    
}

extension ProductListViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.productList?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.cellIdentifier , for: indexPath) as! ProductListCollectionViewCell
        guard let product = viewModel?.productList?.products[indexPath.row] else {return UICollectionViewCell()}
        cell.setDatas(imageUrl: product.image, productName: product.name, productPrice: String(product.price))
        return cell
    }
    
    
}

