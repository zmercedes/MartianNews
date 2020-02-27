//
//  SettingsViewController.swift
//  NYT_MartianNews
//
//  Created by Zoilo Mercedes on 1/23/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var languagePickerView: UIPickerView!

    private let setLanguage: ((Languages) -> Void)

    var setupView: (() -> Void)?
    var language: Languages
    private var disposeBag = DisposeBag()

    init(settings: Settings, setLanguage: @escaping ((Languages) -> Void)) {
        language = settings.language.value
        self.setLanguage = setLanguage
        super.init(nibName: nil, bundle: nil)
        setupView = { [unowned self] in
            settings.language.observe { newLang in
                self.language = newLang
                self.languagePickerView.reloadAllComponents()
            }.dispose(with: self.disposeBag)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        languagePickerView.delegate = self
        setupView!()
    }

    @IBAction func selectButtonPressed(_ sender: Any) {
        let lang = Languages.allCases[languagePickerView.selectedRow(inComponent: 0)]
        setLanguage(lang)
    }

}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Languages.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        self.view.endEditing(true)
        var lang = Languages.allCases[row].make()
        if lang == language.make() {
            lang.append(" ☑️")
        }
        return lang
    }
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
