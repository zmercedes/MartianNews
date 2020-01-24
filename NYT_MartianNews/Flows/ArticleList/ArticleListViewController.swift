//
//  ArticleListViewController.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol ArticleListViewControllerDelegate: class {
    func viewArticle(row: Int)
}

class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var setupTable: (()-> Void)?
    
    weak var delegate: ArticleListViewControllerDelegate?
    
    init(dataSource: ArticleListDataSource) {
        super.init(nibName: nil, bundle: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setupTable = {
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
        delegate?.viewArticle(row: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
