//
//  ArticleListDataSource.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/21/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleListDataSource: NSObject, UITableViewDataSource {

    weak var tableView: UITableView?
    private var articles: [Article] = []
    private var language: Languages? {
        didSet {
            tableView?.reloadData()
        }
    }
    private var imageCache: ImageCache
    private let disposeBag = DisposeBag()
    
    init(imageCache: ImageCache){
        self.imageCache = imageCache
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cell: ArticleListCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.title.text = article.title[language!]
        cell.preview.text = article.body[language!]
        if let image = imageCache.getImage(url: article.imageURL) {
            cell.cellImage.image = image
        } else {
            do {
                let data = try Data(contentsOf: URL(string: article.imageURL)!)
                let image = UIImage(data: data)!
                imageCache.storeImage(url: article.imageURL, newImage: image)
                cell.cellImage.image = image
            } catch {
                print("couldn't get image")
            }
        }
        
        return cell
    }
    
    func updateArticles(articles: [Article]){
        self.articles = articles
    }
    
    func updateLanguage(language: Languages) {
        self.language = language
    }
}
