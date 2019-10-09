//
//  RootViewController.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

protocol RootViewControllerDelegate: AnyObject { //NSObject gives error when coordinate initializer uses 'self' inside
    func RootVCAddTapped()
}

class RootViewController: UIViewController {
    //weak must not be applied to non-class-bound RootVC
    weak var delegate: RootViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        // present modalView
        delegate?.RootVCAddTapped()
    }
}
