//
//  BuyViewController.swift
//  CoordinatorDesignPattern
//
//  Created by LeeKyungjin on 08/05/2019.
//  Copyright © 2019 daisy. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, StoryBoarded {
    weak var coordinator: BuyCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

// I wonder if this could be called when it gets in bg
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinishBuying()
//    }
}
