//
//  Article.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/17/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class Article {
    let title: [Languages:String]
    let imageURL: String
    let imageDimensions: [Int]
    let body: [Languages:String]
    
    init(title: String, image: String, dimensions: [Int], body: String){
        self.title = [.English: title,.Martian: title.toMartian()]
        self.imageURL = image
        self.imageDimensions = dimensions
        self.body = [.English: body, .Martian: body.toMartian()]
    }
}
