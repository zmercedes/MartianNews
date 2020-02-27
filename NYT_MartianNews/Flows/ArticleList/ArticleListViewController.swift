//
//  ArticleListViewController.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewArticle: ((Int) -> Void)
    var setupTable: (() -> Void)?

    init(dataSource: ArticleListDataSource, viewArticle: @escaping ((Int) -> Void)) {
        self.viewArticle = viewArticle
        super.init(nibName: nil, bundle: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setupTable = {
            dataSource.tableView = self.tableView
            self.tableView.dataSource = dataSource
            self.tableView.register(ArticleListCell.self)
            self.tableView.delegate = self
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable!()
    }
}

extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewArticle(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
