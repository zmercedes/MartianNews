//
//  UITableView.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/21/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func registerWithNib<T: UITableViewCell>(_: T.Type)  {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

}
