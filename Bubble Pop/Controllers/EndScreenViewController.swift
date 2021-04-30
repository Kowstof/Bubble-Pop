//
//  EndScreenViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 30/4/21.
//

import UIKit

class EndScreenViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    
    var name = ""
    var score = 0
    var highscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        menuButton.layer.cornerRadius = 5
        setLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) { // Hides the navigation bar. source: https://stackoverflow.com/a/29209623
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // The function first checks if there is an existing highscore. If there isn't, it lets the user know they've set the first one. Otherwise, there are three messages for when they've matched, beat or not reached the current high score
    func determineOutcome() -> String {
        
        if highscore == 0 {
            return "Great work, " + name + "! You've set the first highscore!"
        } else {
            if score < highscore {
                return "Good try, " + name + "! You were " + String(highscore - score + 1) + " points away from beating the highscore!"
            }
            else if score > highscore {
                return "Amazing, " + name + "! You beat the previous highscore by " + String(score - highscore) + " points!"
            }
            else {
                return "Wow, " + name + "! Looks like a tie. One more point and you would have been the champion!"
            }
        }
        
    }
    
    func setLabels() {
        scoreLabel.text = "Score: " + String(score)
        messageLabel.text = determineOutcome()
    }
}
