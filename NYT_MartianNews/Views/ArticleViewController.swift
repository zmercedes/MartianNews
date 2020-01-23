//
//  ArticleViewController.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/22/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    var setupView: (()->Void)?
    
    init(article: Article, language: Languages,image: UIImage){
        super.init(nibName: nil, bundle: nil)
        setupView = {
            self.titleLabel.text = article.title[language]
            self.imageView.image = image
            let height = article.imageDimensions[1]
            self.imageViewHeight.constant = CGFloat(height)
            self.imageView.layoutIfNeeded()
            self.bodyLabel.text = article.body[language]
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView!()
    }

}
