//
//  Article.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/17/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class Article {
    let title: [String:String]
    let imageURL: URL
    let imageDimensions: [Int]
    let body: [String:String]
    
    init(title: String, image: URL, dimensions: [Int], body: String){
        self.title = ["English":title,"Martian":""]
        self.imageURL = image
        self.imageDimensions = dimensions
        self.body = ["English":body, "Martian":""]
    }
}
