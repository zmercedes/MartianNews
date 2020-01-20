//
//  Dependencies.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/20/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

open class Dependencies {
    private lazy var userSettings = UserSettings()
    lazy var dataProvider = DataProvider(settings: userSettings)
}
