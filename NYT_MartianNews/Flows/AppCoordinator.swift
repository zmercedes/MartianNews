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
    
    private let window: UIWindow
    private let rootViewController = UIViewController()
    private let dependencies: Dependencies
    
    private var articleListCoordinator: ArticleListCoordinator?
    
    init(window: UIWindow, dependencies: Dependencies){
        self.window = window
        self.window.rootViewController = rootViewController
        self.dependencies = dependencies
        self.window.backgroundColor = .white
        self.window.makeKeyAndVisible()
    }
    
    func start(){
        navigate(to: .articleList)
    }
    
    internal func navigate(to destination: Destination) {
        switch destination {
        case .articleList:
            let navigationController = UINavigationController()
            rootViewController.present(navigationController, animated: false, completion: nil)
            articleListCoordinator = ArticleListCoordinator(dependencies: dependencies, navigation: navigationController)
            articleListCoordinator!.start()
            
        }
    }
}
