//
//  GameViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    @IBAction func bubbleTouched(_ sender: UIButton) {
        sender.removeFromSuperview()
    }
    
    var name = "Blank"
    var timeRemaining = 60
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerNameLabel.text = name
        countDownLabel.text = String(timeRemaining)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.countingDown()
            self.generateBubble()
        }
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