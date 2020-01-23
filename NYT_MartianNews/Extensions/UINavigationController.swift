//
//  UINavigationController.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/23/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

extension UINavigationController {
    func removeDivider() {
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
