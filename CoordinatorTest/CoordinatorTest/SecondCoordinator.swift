//
//  SecondCoordinator.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 10/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

class SecondCoordinator: Coordinator {
    let secondVC: SecondViewController
    
    init(with viewController: SecondViewController) {
        self.secondVC = viewController
    }
}

extension SecondCoordinator: SecondViewControllerDelegate {
    func closeTapped(_ secondViewController: UIViewController) {
        secondVC.dismiss(animated: true)
    }
    
    func editTapped() {
        let thiredVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ThirdVC") as! ThirdViewController
        thiredVC.delegate = self // I think the top VC on stack should rely on Coordinator of the view below it
        secondVC.present(thiredVC, animated: true)
    }
}

 // I think the top VC on stack should rely on Coordinator of the view below it
extension SecondCoordinator: ThirdViewControllerDelegate {
    func closePressed(_ thirdViewController: UIViewController) {
        thirdViewController.dismiss(animated: true)
    }
}
