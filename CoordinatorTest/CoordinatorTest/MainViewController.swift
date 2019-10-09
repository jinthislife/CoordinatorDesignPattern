//
//  MainViewController.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject { //NSObject gives error when coordinate initializer uses 'self' inside
    func MainVCAddTapped()
    func MainVCPushTapped()
}

class MainViewController: UIViewController {
    //weak must not be applied to non-class-bound MainVC
    weak var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MainVC loaded")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    deinit {
        print("MainVC dismissed")
    }
    
    @objc func addTapped() {
        // present modalView
        delegate?.MainVCAddTapped()
    }
    
    @IBAction func pushTapped(_ sender: UIButton) {
        delegate?.MainVCPushTapped()
    }
}

