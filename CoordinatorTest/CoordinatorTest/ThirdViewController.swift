//
//  ThirdViewController.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

protocol ThirdViewControllerDelegate: AnyObject {
    func closePressed(_ thirdViewController: UIViewController)
}

class ThirdViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    weak var delegate: ThirdViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load ThirdViewController")
    }
    
    deinit {
        print("dissmissed ThirdViewController")
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        delegate?.closePressed(self)
    }
}
