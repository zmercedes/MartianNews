//
//  DataProvider.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/17/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class DataProvider {

    let articles = Dynamic<[Article]>([])

    init() {
        fetchData()
    }

    func fetchData() {
        let url = URL(string: "https://s1.nyt.com/ios-newsreader/candidates/test/articles.json")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("client error: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("server error: \(response)")
                return
            }
            if let mime = httpResponse.mimeType, mime == "application/json", let data = data {
                self.decodeJson(data: data)
            }
        }
        task.resume()
    }

    private func decodeJson(data: Data) {
        var json: Any?
        do {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            print("Cannot decode")
            return
        }

        let articleData = json as! [[String: Any]]
        var newArticles: [Article] = []

        for article in articleData {

            let title = article["title"] as! String
            let body = article["body"] as! String
            var topImageUrl: String = ""
            var dimensions: [Int] = [0, 0]
            let images = article["images"] as! [[String: Any]]
            for image in images {
                let isTopImage = image["top_image"] as! Int
                if isTopImage == 1 {
                    topImageUrl = image["url"] as! String
                    dimensions[0] = image["width"] as! Int
                    dimensions[1] = image["height"] as! Int
                }
            }
            newArticles.append(Article(title: title, image: topImageUrl, dimensions: dimensions, body: body))
        }
        print("\(newArticles.count) articles added.")
        articles.value = newArticles
    }
}
