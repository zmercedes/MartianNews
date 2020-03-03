//
//  ArticleViewController_P.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 3/2/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleViewController_P: UIViewController {

    let titleLabel: UILabel = {
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.adjustsFontSizeToFitWidth = true
        t.font = UIFont.boldSystemFont(ofSize: 28.0)
        t.numberOfLines = 2
        return t
    }()
    let imageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.clipsToBounds = true
        i.contentMode = .scaleAspectFill
        return i
    }()
    let bodyLabel: UILabel = {
        let b = UILabel()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.font = b.font.withSize(17)
        b.numberOfLines = 0
        return b
    }()
    private let padding: CGFloat = 20
    private let article: Article
    private let disposeBag = DisposeBag()
    private let image: UIImage

    init(article: Article, dependencies: Dependencies) {
        self.article = article
        self.image = dependencies.imageCache.getImage(url: article.imageURL) ?? UIImage()
        super.init(nibName: nil, bundle: nil)
        dependencies.settings.language.observe { language in
            self.titleLabel.text = article.title[language]
            self.bodyLabel.text = article.body[language]
        }.dispose(with: disposeBag)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .white
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(bodyLabel)
        imageView.image = image

        let guide = view.safeAreaLayoutGuide
        let imageHeight = CGFloat(article.imageDimensions[1])
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: guide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: imageView, attribute: .top, multiplier: 1, constant: -padding),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageHeight),
            NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: bodyLabel, attribute: .top, multiplier: 1, constant: -padding),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
}
