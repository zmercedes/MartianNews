//
//  Settings.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/23/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

final class Settings {
    
    var language = Dynamic<Languages>(.English)
    private let settingsStore: SettingsStore
    private let disposeBag = DisposeBag()
    
    init(store: SettingsStore){
        self.settingsStore = store
        
        language.observe { newlang in
            if(self.settingsStore.getLanguage() != newlang){
                self.settingsStore.storeInfo(language: newlang)
            }
        }.dispose(with: disposeBag)
        
        if let lang = self.settingsStore.getLanguage(), language.value != lang {
            self.language.value = lang
        }
    }
}
