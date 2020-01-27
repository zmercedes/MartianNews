//
//  ImageCache.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/21/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

final class ImageCache {
    private var images: [String: UIImage] = [:]

    func storeImage(url: String, newImage: UIImage) {
        images[url] = newImage
    }

    func getImage(url: String) -> UIImage? {
        if let image = images[url] {
            return image
        } else {
            return nil
        }
    }

    func clear() {
        for key in images.keys {
            images[key] = nil
        }
    }

}
