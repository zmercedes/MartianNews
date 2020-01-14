//
//  AppCoordinator.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/14/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    enum Destination {
        case articleList
    }
    
    init(){
        
    }
    
    func start(){
        
    }
    
    internal func navigate(to destination: Destination) {
        switch destination {
        case .articleList:
            print("navigated to Article List")
            
        }
    }
}
