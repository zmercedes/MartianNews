//
//  DataProvider.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/17/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class DataProvider {
    var articles: [Article]?
    
    func fetchData(){
        articles = []
        do {
            let data = try Data(contentsOf: URL(string: "https://s1.nyt.com/ios-newsreader/candidates/test/articles.json")!)
            decodeJson(data: data)
        } catch {
            print("Unable to get data")
        }
    }
    
    private func decodeJson(data: Data){
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        let articleData = json as! [[String: Any]]
        var newArticles: [Article] = []
        
        for article in articleData {
            
            let title = article["title"] as! String
            let body = article["body"] as! String
            var topImageUrl: String = ""
            var dimensions: [Int] = [0,0]
            let images = article["images"] as! [[String: Any]]
            for image in images {
                let isTopImage = image["top_image"] as! Int
                if(isTopImage == 1){
                    topImageUrl = image["url"] as! String
                    dimensions[0] = image["width"] as! Int
                    dimensions[1] = image["height"] as! Int
                }
            }
            newArticles.append(Article(title: title, image: URL(string: topImageUrl)!, dimensions: dimensions, body: body))
        }
        print(String(newArticles.count) + " new articles added.")
        articles = newArticles
    }
}
