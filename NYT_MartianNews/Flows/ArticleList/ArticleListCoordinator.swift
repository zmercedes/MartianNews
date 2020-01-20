//
//  ArticleListCoordinator.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleListCoordinator: Coordinator {
   
    enum Destination {
        case selectedArticle
    }
    
    func start() {
        
    }
    
    func navigate(to destination: ArticleListCoordinator.Destination) {
        switch destination {
        case .selectedArticle:
            print("Navigated to selected article")
        }
    }
    
}
