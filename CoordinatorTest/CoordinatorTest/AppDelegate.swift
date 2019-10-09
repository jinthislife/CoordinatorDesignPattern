//
//  AppDelegate.swift
//  CoordinatorTest
//
//  Created by Jin Lee on 9/10/19.
//  Copyright © 2019 Jin Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RootVC") as MainViewController
//            coordinator = Coordinator(with: rootVC)
//        print(window!.MainViewController === nil)
//        coordinator = Coordinator(window!.RootViewController as! UINavigationController)
//            print(coordinator === nil)
        return true
    }

}

