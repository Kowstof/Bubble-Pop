//
//  LeaderboardViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 29/4/21.
//

import UIKit

class LeaderboardViewController: UITableViewController {
    
    @IBOutlet var leaderboardTable: UITableView!
    
    var playerScores: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let playerData = UserDefaults.standard.value(forKey: "playerScores") as? [[String]] {
            self.playerScores = playerData
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playerScores.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboardCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = playerScores[indexPath.row][0]
        cell.detailTextLabel?.text = playerScores[indexPath.row][1]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Leaderboard"
    }
    
}
