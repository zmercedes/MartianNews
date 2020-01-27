//
//  UserSettings.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/19/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class SettingsStore {

    enum Key: String {
        case language
        func make() -> String {
            return self.rawValue
        }
    }

    let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        if getLanguage() == nil { saveValue(forKey: .language, value: .English) }
    }

    func storeInfo(language: Languages) {
        saveValue(forKey: .language, value: language)
    }

    func getLanguage() -> Languages? {
        let language = readValue(forKey: .language)
        switch language {
        case Languages.English.make():
            return .English
        case Languages.Martian.make():
            return .Martian
        default:
            return nil
        }
    }

    private func saveValue(forKey key: Key, value: Languages) {
        userDefaults.set(value.make(), forKey: key.make())
    }

    private func readValue(forKey key: Key) -> String? {
        return userDefaults.string(forKey: key.make())
    }
}
