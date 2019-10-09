//
//  SecondViewController.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func closeTapped(_ secondViewController: UIViewController)
}

class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate?
    @IBOutlet weak var dismissbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC loaded")
        dismissbutton.isHidden = navigationController != nil
    }
    
    deinit {
        print("SecondVC dismissed")
    }

    @IBAction func dismissPressed(_ sender: UIButton) {
        delegate?.closeTapped(self)
    }
}
