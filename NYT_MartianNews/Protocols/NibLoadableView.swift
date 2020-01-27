//
//  NibLoadableView.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/21/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {

    static var nibName: String {
        return String(describing: self)
    }

}
