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
        case settings
    }
    
    private let dependencies: Dependencies
    private let navigationController: UINavigationController
    private let dataSource : ArticleListDataSource
    private let disposeBag = DisposeBag()
    
    private var currentArticle: Article?
    
    init(dependencies: Dependencies, navigation: UINavigationController) {
        self.dependencies = dependencies
        self.navigationController = navigation
        self.dataSource = ArticleListDataSource(imageCache: dependencies.imageCache)
    }
    
    func start() {
        print("navigated to Article List")
        let viewController = ArticleListViewController(dataSource: self.dataSource)
        viewController.title = "The Martian News"
        addSettingsButton(view: viewController)
        viewController.delegate = self
        navigationController.setViewControllers([viewController], animated: true)
        dependencies.dataProvider.articles.observe { articles in
            let language = self.dependencies.settings.language.value
            self.dataSource.updateArticles(articles: articles, language: language)
        }.dispose(with: disposeBag)
    }
    
    func navigate(to destination: ArticleListCoordinator.Destination) {
        switch destination {
        case .selectedArticle:
            let viewController = ArticleViewController(article: currentArticle!, dependencies: dependencies)
            viewController.title = "Article"
            addSettingsButton(view: viewController)
            navigationController.pushViewController(viewController, animated: true)
        case .settings:
            print("navigated to settings")
            let viewController = SettingsViewController()
            viewController.title = "Settings"
            navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func addSettingsButton(view: UIViewController) {
        let settingImage = #imageLiteral(resourceName: "ico-cog")
        let settingsButton = UIBarButtonItem(image: settingImage, style: .plain, target: self, action: #selector(settingsButtonPressed))
        view.navigationItem.setRightBarButton(settingsButton, animated: false)
    }
    
    @objc func settingsButtonPressed() {
        navigate(to: .settings)
    }
}

extension ArticleListCoordinator: ArticleListViewControllerDelegate {
    func viewArticle(row: Int) {
        currentArticle = self.dependencies.dataProvider.articles.value[row]
        navigate(to: .selectedArticle)
    }
}
