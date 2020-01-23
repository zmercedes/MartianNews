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
    
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    var setupView: (()->Void)?
    let disposeBag = DisposeBag()
    
    init(article: Article, dependencies: Dependencies){
        super.init(nibName: nil, bundle: nil)
        setupView = {
            self.titleLabel.adjustsFontSizeToFitWidth = true
            let lang = dependencies.dataProvider.language.value
            self.titleLabel.text = article.title[lang]
            self.bodyLabel.text = article.body[lang]
            let image = dependencies.imageCache.getImage(url: article.imageURL)
            self.imageView.image = image
            let height = article.imageDimensions[1]
            self.imageViewHeight.constant = CGFloat(height)
            self.imageView.layoutIfNeeded()
            dependencies.dataProvider.language.observe { language in
                self.titleLabel.text = article.title[language]
                self.bodyLabel.text = article.body[language]
            }.dispose(with: self.disposeBag)
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
