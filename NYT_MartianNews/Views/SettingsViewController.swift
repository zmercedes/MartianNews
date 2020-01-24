//
//  SettingsViewController.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/23/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func selectedLanguage(language: Languages)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var languagePickerView: UIPickerView!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languagePickerView.delegate = self
    }


}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return Languages.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        print("doing")
        self.view.endEditing(true)
        let language = Languages.allCases[row].make()
        return language
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
}
