//
//  Coordinator.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/14/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    associatedtype Destination
    
    func start()
    func navigate(to destination: Destination)
}
