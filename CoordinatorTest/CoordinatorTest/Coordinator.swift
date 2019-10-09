//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

final class Coordinator {
    var navigationController: UINavigationController?
    var mainViewController: MainViewController
//    var secondViewController: SecondViewController? = nil
    // Unlike MainVC, this VC keeps being pushed and poped // if coordinator keeps holding this this VC is not deallocated right after being popped
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.mainViewController = navigationController.viewControllers.first as! MainViewController
        self.mainViewController.delegate = self
    }
    
    deinit {
        print("dealloc Coordinator")
    }
}

extension Coordinator: MainViewControllerDelegate {
    func MainVCAddTapped() {
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        secondVC.delegate = self
        mainViewController.present(secondVC, animated: true)
    }
    
    func MainVCPushTapped() {
        // StoryBoard instantiation should do forced type casting?
        let secondViewController2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        navigationController?.pushViewController(secondViewController2, animated: true)
        secondViewController2.delegate = self
    }
}


extension Coordinator: SecondViewControllerDelegate, ThirdViewControllerDelegate {
    func closePressed(_ thirdViewController: UIViewController) {
        thirdViewController.dismiss(animated: true)
    }
    
    func closeTapped(_ secondViewController: UIViewController) {
        secondViewController.dismiss(animated: true)
    }
    
    func editTapped(_ secondViewController: UIViewController) {
        let thirdViewController2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ThirdVC") as! ThirdViewController
        thirdViewController2.delegate = self
        secondViewController.present(thirdViewController2, animated: true)
    }
}


