//
//  StatesViewController.swift
//  Assignment4
//
//  Created by Sydney Blackburn on 10/25/18.
//  Copyright © 2018 Sydney Blackburn. All rights reserved.
//

import UIKit

class StatesViewController: UITableViewController {
    
    // MARK: - Variables
    @IBAction func backButton(_ sender: UIBarButtonItem){
    }
    var statesAndInfo: Dictionary<String,Array<String>>?
    var states: Array<String>?
    var state: String?
    var stateInfo: Array<String>?
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Content insets
        // Get height of status bar to set insets
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        // Set row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
        // Get info from state.plist and store in vars
        let data:Bundle = Bundle.main
        let statesPlist:String? = data.path(forResource: "states", ofType: "plist")
        if statesPlist != nil {
            statesAndInfo = (NSDictionary.init(contentsOfFile: statesPlist!) as! Dictionary)
            states = statesAndInfo?.keys.sorted()
            state = states![0]
            stateInfo = statesAndInfo![state!]!
        }
    }
    
    // MARK: - tableView funcs
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Set rows to the number of states there are
        guard let numOfStates = states else {
            return 0
        }
        return numOfStates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create instance of UITableViewCell with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Set text on cell
        let nameOfState = states![indexPath.row]
        cell.textLabel?.text = nameOfState
        
        return cell
    }
    
    // MARK: - segue funcs
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue..
        // Show the details of the row selected
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get info associated with row and pass it along
                let stateName = states![row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.stateName = stateName
                detailViewController.stateInfo = statesAndInfo![stateName]!
                navigationItem.title = "State Info"
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}
