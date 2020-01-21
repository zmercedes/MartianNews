//
//  ArticleListDataSource.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/21/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleDataSource: NSObject, UITableViewDataSource {
    
    weak var tableView: UITableView?
    private var articles: [Article] = []
    private var language: Languages?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        let cell: ArticleListCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.title.text = article.title[language!]
        return cell
    }
}
