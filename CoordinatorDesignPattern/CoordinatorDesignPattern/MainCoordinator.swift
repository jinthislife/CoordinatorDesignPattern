//
//  MainCoordinator.swift
//  CoordinatorDesignPattern
//
//  Created by LeeKyungjin on 08/05/2019.
//  Copyright © 2019 daisy. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
        navigationController.delegate = self
    }
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
    func createAccount() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we're moving from
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        //check whether our view controller array already contains that view controller
        //in case of push, it will return here
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // We're still here - it means we're popping the view controller, so we can check whether it's a buy view controller
        if let buyViewController = fromViewController as? BuyViewController {
            // we're popping a buy view coordinator; end its coordinator
            childDidFinish(buyViewController.coordinator)
        }
        
    }
    
}
