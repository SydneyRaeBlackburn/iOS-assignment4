//
//  SportsViewController.swift
//  Assignment4
//
//  Created by Sydney Blackburn on 10/28/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Variables
    @IBOutlet var sportsPicker: UIPickerView!
    var countryAndSports: Dictionary<String,Array<String>>?
    var countries: Array<String>?
    var country: String?
    var countrySports: Array<String>?
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize picker
        if sportsPicker != nil {
            sportsPicker!.delegate = self
            sportsPicker!.dataSource = self
        }
        
        // Get info from states.plist and store in variables
        let data:Bundle = Bundle.main
        let sportsPlist:String? = data.path(forResource: "sports", ofType: "plist")
        if sportsPlist != nil {
            countryAndSports = (NSDictionary.init(contentsOfFile: sportsPlist!) as! Dictionary)
            countries = countryAndSports?.keys.sorted()
            country = countries![0]
            countrySports = countryAndSports![country!]!
        }
    }
    
    // MARK: - picker funcs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // create 2 components
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // get number of rows for each component
        guard countries != nil && countrySports != nil else {
            return 0
        }
        
        switch component {
        case 0: return countries!.count
        case 1: return countrySports!.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // get the titles for each row of each component
        guard countries != nil && countrySports != nil else {
            return "None"
        }
        
        switch component {
        case 0: return countries![row]
        case 1: return countrySports![row]
        default: return "None"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // reset component 1 to certain titles associated with item chosen in component 0
        guard countries != nil && countrySports != nil else {
            return
        }
        
        if component == 0 {
            country = countries![row]
            countrySports = countryAndSports![country!]!.sorted()
            pickerView.reloadComponent(1)
        }
        
        // Display alert for the country and sport selected
        if component == 1 {
            let alert = UIAlertController(title: "Country and Sport", message: "\(country!) has \(countrySports![row])", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - viewWill funcs
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // name for sports tab
        tabBarItem.title = "Sports"
    }
    
}
