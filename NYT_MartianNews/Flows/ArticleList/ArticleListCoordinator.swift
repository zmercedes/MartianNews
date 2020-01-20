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
    
    private let dependencies: Dependencies
    private let navigationController: UINavigationController
    
    init(dependencies: Dependencies, navigation: UINavigationController) {
        self.dependencies = dependencies
        self.navigationController = navigation
    }
    
    func start() {
        print("navigated to Article List")
    }
    
    func navigate(to destination: ArticleListCoordinator.Destination) {
        switch destination {
        case .selectedArticle:
            print("Navigated to selected article")
        }
    }
    
}
