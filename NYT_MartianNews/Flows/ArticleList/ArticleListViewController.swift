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
    var setupTable: (()-> Void)?
    
    init(dataSource: ArticleListDataSource) {
        super.init(nibName: nil, bundle: nil)
        setupTable = {
            self.tableView.dataSource = dataSource
            self.tableView.register(ArticleListCell.self)
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
