//
//  Dependencies.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

open class Dependencies {
    private lazy var settingsStore = SettingsStore()
    lazy var imageCache = ImageCache()
    lazy var dataProvider = DataProvider()
    lazy var settings = Settings(store: settingsStore)
}
