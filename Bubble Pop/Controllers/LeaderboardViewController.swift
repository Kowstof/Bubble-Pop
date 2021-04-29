//
//  LeaderboardViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 29/4/21.
//

import UIKit

class LeaderboardViewController: UITableViewController {
    
    @IBOutlet var leaderboardTable: UITableView!
    
    let names: [String] = [
        "Joe",
        "Breo",
        "Not him"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
}
