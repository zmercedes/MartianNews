//
//  ArticleListCell.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/21/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var preview: UILabel!
    @IBOutlet weak var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.title.adjustsFontSizeToFitWidth = true
        self.preview.sizeToFit()
    }

    override func prepareForReuse() {
        cellImage.image = nil
        title.text = nil
        preview.text = nil
    }

}
