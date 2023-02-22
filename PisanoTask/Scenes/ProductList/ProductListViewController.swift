//
//  ViewController.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 20.02.2023.
//

import UIKit

protocol ProductListPageDisplayLogic {
    func displayProductList()
    func displayEmptyView()
    func displayLoadingView()
    func displayErrorMessage(errorMessage : String)
    func removeCollectionView()
    func removeEmptyView()
    func removeLoadingView()
}

protocol ProductListPageRouterLogic {
    func navigateToProductDetailPage(model : Product)
}

protocol ProductListPageUserInteractions{
    func didTappedTryAgainButton()
}

class ProductListViewController: BaseViewController {
    // MARK: - UI Outlets
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
    var loadingView : LoadingView?
    var emptyView : EmptyView?
    // MARK: - Public Properties
    var viewModel : ProductListViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLoadingView()
        viewModel = ProductListViewModel(viewController: self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        configure(title: Constants.products)
        viewModel?.checkProductList()
    }
    
    // MARK: - UI Configuration
    override func configure(title: String) {
        super.configure(title: title)
    }
    
}
// MARK: - Display Logic
extension ProductListViewController : ProductListPageDisplayLogic {
    
    func displayProductList() {
        removeCollectionView()
        removeEmptyView()
        view.addSubview(productCollectionView)
        
        productCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        productCollectionView.reloadData()
        removeLoadingView()
    }
    
    func displayEmptyView() {
        removeCollectionView()
        removeEmptyView()
        emptyView = EmptyView()
        emptyView?.tryAgainButton.didTapButton = {
            self.didTappedTryAgainButton()
        }
        guard let emptyView = emptyView else {return}
        view.addSubview(emptyView)
        emptyView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        removeLoadingView()
    }
    
    func displayErrorMessage(errorMessage : String) {
        let alert = UIAlertController(title: Constants.connectionProblem, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ok, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        displayEmptyView()
        removeLoadingView()
    }
    
    func displayLoadingView() {
        loadingView = LoadingView()
        guard let loadingView = loadingView else {return}
        view.addSubview(loadingView)
        loadingView.snp.makeConstraints({ make in
            make.edges.equalToSuperview()
        })
    }
    func removeCollectionView() {
        productCollectionView.removeFromSuperview()
    }
    
    func removeEmptyView() {
        emptyView?.removeFromSuperview()
        emptyView = nil
    }
    func removeLoadingView() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}
// MARK: - Product Collection List
extension ProductListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.productList?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.cellIdentifier , for: indexPath) as! ProductListCollectionViewCell
        guard let product = viewModel?.productList?.products[indexPath.row] else {return UICollectionViewCell()}
        cell.setDatas(model: product)
        return cell
    }
}
// MARK: - CollectionViewDelegate
extension ProductListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.fetchProduct(index: indexPath.row)
    }
}
// MARK: - Router Logic
extension ProductListViewController : ProductListPageRouterLogic {
    func navigateToProductDetailPage(model: Product) {
        let destinationVC = ProductDetailViewController()
        destinationVC.configureProductDatas(model: model)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
// MARK: - User Actions
extension ProductListViewController : ProductListPageUserInteractions {
    func didTappedTryAgainButton() {
        viewModel?.fetchProductList()
    }
}
