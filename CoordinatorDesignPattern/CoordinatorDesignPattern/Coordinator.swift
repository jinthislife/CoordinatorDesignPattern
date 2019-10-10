//
//  Coordinator.swift
//  CoordinatorDesignPattern
//
//  Created by LeeKyungjin on 08/05/2019.
//  Copyright © 2019 daisy. All rights reserved.
//

import UIKit

// should always be classes because they need to be shared in lots of places, so we can mark this protocol as being class-only
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
