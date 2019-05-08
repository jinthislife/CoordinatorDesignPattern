//
//  StoryBoarded.swift
//  CoordinatorDesignPattern
//
//  Created by LeeKyungjin on 08/05/2019.
//  Copyright © 2019 daisy. All rights reserved.
//

import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}

extension StoryBoarded {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}
