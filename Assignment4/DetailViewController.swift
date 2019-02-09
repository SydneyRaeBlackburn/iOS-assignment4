//
//  DetailViewController.swift
//  Assignment4
//
//  Created by Sydney Blackburn on 10/25/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate,
UINavigationControllerDelegate {
    
    // MARK: - Variables
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var abbrLabel: UILabel!
    @IBOutlet var capitalLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    var stateName: String?
    var stateInfo: Array<String>?
    
    // MARK: - viewWill funcs
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the state info from info pased from states view
        stateLabel.text = "State: \(stateName ?? "")"
        abbrLabel.text = "Abbreviation: \(stateInfo?[0] ?? "")"
        capitalLabel.text = "Capital: \(stateInfo?[1] ?? "")"
        dateLabel.text = "Date of Admission: \(stateInfo?[2] ?? "")"
    }
}
