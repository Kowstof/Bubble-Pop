//
//  GameViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func bubbleTouched(_ sender: Bubble) {
        score += sender.pointValue
        updateScore()
        sender.removeFromSuperview()
    }
    
    var name = "Blank"
    var timeRemaining = 60
    var score = 0
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countDownLabel.text = String(timeRemaining)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.countingDown()
            self.generateBubble()
        }
    }
    
    func updateScore() {
        
    }
    
    @objc func countingDown() {
        timeRemaining -= 1
        countDownLabel.text = String(timeRemaining)
        
        if timeRemaining == 0 {
            timer.invalidate()
        }
    }
    
    @objc func generateBubble() {
        let bubble = Bubble()
        bubble.addTarget(self, action: #selector(bubbleTouched), for: .touchUpInside)
        self.view.addSubview(bubble)
    }
    
    
}
