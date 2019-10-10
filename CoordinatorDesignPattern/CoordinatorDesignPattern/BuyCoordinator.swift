//
//  BuyCoordinator.swift
//  CoordinatorDesignPattern
//
//  Created by Jin Lee on 10/10/19.
//  Copyright © 2019 daisy. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
/// to avaoid retain cycle, because MainCoordinator already owns the child
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinishBuying() {
//        parentCoordinator?.childDidFinish(self)
//    }
    
}
