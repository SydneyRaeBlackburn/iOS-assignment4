//
//  InitialViewController.swift
//  Assignment4
//
//  Created by Sydney Blackburn on 10/25/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Variables
    @IBOutlet var nameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBAction func backgroundTapped(_ sender: Any) {
        view.endEditing(true)
    }
    var name: String?
    
    @IBAction func statesButton(_ sender: UIButton) {
    }
    @IBAction func tabButton(_ sender: UIButton) {
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - keyboard funcs
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss keyboard when return is pressed
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Segue funcs
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
         // Go to tab or name scene..
         // Only if name and password text fields contain more than 3 characters
        if identifier == "statesView" || identifier == "tabView" {
            if let password = passwordText.text, let name = nameText.text {
                if password.count > 3 && name.count > 3 {
                    return true
                }
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "tabView" segue..
        // Change name in name scene to reflect name user inputted in the initial scene
        switch segue.identifier {
        case "tabView"?:
            let tabController = segue.destination as! UITabBarController
            let nameViewController = tabController.viewControllers![0] as! NameViewController
            if let name = nameText.text {
                nameViewController.name = name
            }
        default:
            break
        }
    }
    
    // MARK: - viewWill funcs
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Save changes to name field in User Defaults to pass around later
        nameText.text = "\(UserDefaults.standard.string(forKey: "name") ?? "")"
    }
}
