//
//  GameViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit
import CoreGraphics

class GameViewController: UIViewController {

    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var highScoreText: UILabel!
    
    var name = "Blank"
    var timeRemaining = 60
    var score = 0
    var timer = Timer()
    var highScore = 0
    var maxBubbles = 0
    var bubblesOnScreen = 0
    var bubbleCollection: [Bubble] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startTimer()
        updateScore()
        print(maxBubbles)
        
    }
    
    func updateScore() {
        scoreText.text = String(score)
        
        if score > highScore {
            highScore = score
            highScoreText.text = String(highScore)
        }
    }
    
    @objc func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.countDown()
            self.generateBubbles()
        }
    }
    
    @objc func countDown() {
        timeRemaining -= 1
        countDownLabel.text = String(timeRemaining)
        
        if timeRemaining == 0 {
            timer.invalidate()
        }
    }
    
    @objc func generateBubbles() {
        let difference = maxBubbles - bubblesOnScreen
        var maxNewBubbles: Int
        
        switch difference {
        case 0:
            maxNewBubbles = 0
        case 1:
            maxNewBubbles = 1
        case 2:
            maxNewBubbles = 2
        default:
            maxNewBubbles = Int.random(in: 1...3)
        }
        
                
        if maxNewBubbles > 0 {
            for _ in 1...maxNewBubbles {
                let bubble = Bubble()
                
                for bubble2 in bubbleCollection {
                    //let touching = 
                    //if bubble2
                }
                
                bubble.addTarget(self, action: #selector(bubbleTouched), for: .touchUpInside)
                self.view.addSubview(bubble)
                bubblesOnScreen += 1
            }
        }
    }
    
    @IBAction func bubbleTouched(_ sender: Bubble) {
        score += sender.pointValue
        updateScore()
        sender.removeFromSuperview()
        bubblesOnScreen -= 1
    }
}
