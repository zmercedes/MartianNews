//
//  Languages.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

enum Languages: String, CaseIterable {
    case English
    case Martian
    func make() -> String {
        return self.rawValue
    }
}
