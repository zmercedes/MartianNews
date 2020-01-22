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
    private let dataSource : ArticleListDataSource
    private let disposeBag = DisposeBag()
    
    init(dependencies: Dependencies, navigation: UINavigationController) {
        self.dependencies = dependencies
        self.navigationController = navigation
        self.dataSource = ArticleListDataSource(imageCache: dependencies.imageCache)
    }
    
    func start() {
        print("navigated to Article List")
        let viewController = ArticleListViewController(dataSource: self.dataSource)
        viewController.title = "The Martian News"
        navigationController.setViewControllers([viewController], animated: false)
        dependencies.dataProvider.articles.observe { articles in
            let language = self.dependencies.dataProvider.language.value
            self.dataSource.updateArticles(articles: articles, language: language)
        }.dispose(with: disposeBag)
    }
    
    func navigate(to destination: ArticleListCoordinator.Destination) {
        switch destination {
        case .selectedArticle:
            print("Navigated to selected article")
        }
    }
    
}
