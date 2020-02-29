//
//  ArticleListViewController_P.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 2/27/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleListViewController_P: UIViewController {

    var tableView: UITableView!
    private let dataSource: ArticleListDataSource
    private let viewArticle: ((Int) -> Void)

    init(dataSource: ArticleListDataSource, viewArticle: @escaping ((Int) -> Void)) {
        self.dataSource = dataSource
        self.viewArticle = viewArticle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .groupTableViewBackground
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .groupTableViewBackground
        tableView.register(ArticleListCell_P.self)
        tableView.dataSource = self.dataSource
        self.dataSource.myTableView = self.tableView
        tableView.delegate = self
        view.addSubview(tableView)

        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}

extension ArticleListViewController_P: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewArticle(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 167
    }
}
