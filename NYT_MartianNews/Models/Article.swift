//
//  Article.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/17/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class Article {
    let title: String
    let imageURL: URL
    let body: String
    
    init(title: String, image: URL, body: String){
        self.title = title
        self.imageURL = image
        self.body = body
    }
}
