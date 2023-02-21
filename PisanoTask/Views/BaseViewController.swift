//
//  BaseViewController.swift
//  PisanoTask
//
//  Created by Akın Aksoy on 21.02.2023.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configure(title : String) {
        self.title = title
        navigationController?.navigationBar.backgroundColor = UIColor.setColor(.navigationBarColor)
        view.backgroundColor = UIColor.setColor(.backgroundColor) 
    }
    
}
