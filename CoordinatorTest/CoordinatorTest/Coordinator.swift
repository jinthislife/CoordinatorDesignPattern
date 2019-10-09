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
    let rootViewController: RootViewController
    
//    init(with rootViewController: RootViewController) {
//        super.init()
//        self.rootViewController = rootViewController
//        rootViewController.delegate = self
//        self.navigationController = rootViewController.navigationController
        // self used before super.init() call
//
//    }
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.rootViewController = navigationController.viewControllers.first as! RootViewController
        self.rootViewController.delegate = self
    }
    
    deinit {
        print("dealloc Coordinator")
    }
}

extension Coordinator: RootViewControllerDelegate {
    func RootVCAddTapped() {
        let secondVC = UIStoryboard().instantiateViewController(identifier: "SecondVC")
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
}
