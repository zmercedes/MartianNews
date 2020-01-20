//
//  UserSettings.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/19/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class UserSettings {
    
    enum Key: String {
        case language
        func make() -> String {
            return self.rawValue + "_0"
        }
    }
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard){
        self.userDefaults = userDefaults
        storeInfo(language: .English)
    }
    
    func storeInfo(language: Languages){
        saveValue(forKey: .language, value: language)
    }
    
    func getLanguage() -> Languages? {
        return readValue(forKey: .language)
    }
    
    private func saveValue(forKey key: Key, value: Languages){
        userDefaults.set(value, forKey: key.make())
    }
    
    private func readValue<T>(forKey key: Key) -> T? {
        return userDefaults.value(forKey: key.make()) as? T
    }
}
