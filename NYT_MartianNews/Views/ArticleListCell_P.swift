//
//  ArticleListCell_P.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 2/27/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleListCell_P: UITableViewCell {

    var title: UILabel!
    var preview: UILabel!
    var cellImage: UIImageView!
    let padding: CGFloat = 10

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .groupTableViewBackground

        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.adjustsFontSizeToFitWidth = true
        title.font = UIFont.boldSystemFont(ofSize: 18.0)
        title.numberOfLines = 2

        preview = UILabel()
        preview.translatesAutoresizingMaskIntoConstraints = false
        preview.font = preview.font.withSize(15)
        preview.numberOfLines = 3

        cellImage = UIImageView()
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.clipsToBounds = true
        cellImage.contentMode = .scaleAspectFill

        self.addSubview(containerView)
        containerView.addSubview(title)
        containerView.addSubview(preview)
        containerView.addSubview(cellImage)

        let guide = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            containerView.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 4),
            containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: preview.bottomAnchor, constant: 24),
            title.heightAnchor.constraint(equalToConstant: 55),
            title.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            title.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            NSLayoutConstraint(item: title, attribute: .bottom, relatedBy: .equal, toItem: preview, attribute: .top, multiplier: 1, constant: padding),
            NSLayoutConstraint(item: cellImage, attribute: .leading, relatedBy: .equal, toItem: title, attribute: .trailing, multiplier: 1, constant: padding),
            preview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            NSLayoutConstraint(item: cellImage, attribute: .leading, relatedBy: .equal, toItem: preview, attribute: .trailing, multiplier: 1, constant: padding),
            cellImage.heightAnchor.constraint(equalToConstant: 100),
            cellImage.widthAnchor.constraint(equalToConstant: 100),
            cellImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        title.text = nil
        preview.text = nil
        cellImage.image = nil
    }

}
