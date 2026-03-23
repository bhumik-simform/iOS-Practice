//
//  CountryChooseViewController.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 26/03/26.
//

import UIKit


class CountryChooseViewController: UIViewController {
    @IBOutlet weak var countryPicker: UIPickerView!
    
    let countryList: [String] = Locale.Region.isoRegions.compactMap { region in
        Locale.current.localizedString(forRegionCode: region.identifier)
    }.sorted()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPicker.dataSource = self
        countryPicker.delegate = self
    }
    
    
    
    @IBAction func ChooseCountry(_ sender: Any) {
        AppSate.sahred.selectedCountry = countryList[countryPicker.selectedRow(inComponent: 0)]
        self.tabBarController?.selectedIndex = 1
    }
}


extension CountryChooseViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
}

extension CountryChooseViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
}
