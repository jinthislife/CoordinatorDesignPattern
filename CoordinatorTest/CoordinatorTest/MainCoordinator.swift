//
//  MainCoordinator.swift
//  MainCoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var mainViewController: MainViewController
    var childCoordinators: [Coordinator]?
//    var secondViewController: SecondViewController? = nil
    // Unlike MainVC, this VC keeps being pushed and poped // if coordinator keeps holding this this VC is not deallocated right after being popped
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.mainViewController = navigationController.viewControllers.first as! MainViewController
        self.mainViewController.delegate = self
        self.childCoordinators = [Coordinator]()
    }
    
    deinit {
        print("dealloc Coordinator")
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    func MainVCAddTapped() {
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        let secondCoordinator = SecondCoordinator(with: secondVC)
        childCoordinators?.append(secondCoordinator)
        secondVC.delegate = secondCoordinator
        mainViewController.present(secondVC, animated: true)
    }
    
    func MainVCPushTapped() {
        // StoryBoard instantiation should do forced type casting?
        let secondViewController2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        let secondCoordinator = SecondCoordinator(with: secondViewController2)
        childCoordinators?.append(secondCoordinator)
        navigationController?.pushViewController(secondViewController2, animated: true)
    }
}
