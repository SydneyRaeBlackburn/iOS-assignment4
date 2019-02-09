//
//  NameViewController.swift
//  Assignment4
//
//  Created by Sydney Blackburn on 10/28/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit

class NameViewController: UIViewController, UITextFieldDelegate, UITabBarDelegate {
    
    // MARK: - Variables
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBAction func backButton(_ sender: UIButton) {
    }
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    var name: String?
    
    // MARK: - keyboard funcs
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss keyboard when return is pressed
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - viewWill funcs
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Name for name tab
        tabBarItem.title = "Name"
        
        // change name text to what user edited it to, if any..
        nameTextField.text = name ?? ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Clear first responder
        view.endEditing(true)
        
        // Save changes to name text
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
    }
    
    // MARK: - segue funcs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "initialView" segue
        switch segue.identifier {
        case "initialView"?:
            // Save user defaults to be passed around later
            UserDefaults.standard.set(nameTextField.text, forKey: "name")
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}


