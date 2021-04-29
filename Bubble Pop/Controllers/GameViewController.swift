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
        highScoreText.text = "0"
        
        if score > highScore {
            highScore = score
            highScoreText.text = String(highScore)
        }
    }
    
    @objc func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            //self.countDown()
            self.timeRemaining -= 1
            self.countDownLabel.text = String(self.timeRemaining)
            self.generateBubbles()
            
            if self.timeRemaining == 0 {
                timer.invalidate()
            }
        }
    }
    
//    @objc func countDown() {
//
//    }
    
    @objc func makeBubble(bubble: Bubble) {
        bubble.addTarget(self, action: #selector(bubbleTouched), for: .touchUpInside)
        self.view.addSubview(bubble)
        bubbleCollection.append(bubble)    }
    
    // randomly adds between 1 and 3 new bubbles. Checks to make sure it doesn't exceed the specified max bubble limit. Also checks for intersects before creating the new bubble
    @objc func generateBubbles() {
        let difference = maxBubbles - bubbleCollection.count
        var maxNewBubbles: Int
        
        if difference < 4 {
            maxNewBubbles = difference + 1
        } else {
            maxNewBubbles = 5
        }
        
        if bubbleCollection.isEmpty {
            let firstBubble = Bubble()
            makeBubble(bubble: firstBubble)
        }
        
        for _ in 1...maxNewBubbles {
            var touching = false
            let newBubble = Bubble()
            for bubble in bubbleCollection {
                if newBubble.frame.intersects(bubble.frame) {
                    touching = true
                }
            }
            
            if !touching {
                makeBubble(bubble: newBubble)
            }
        }
    }
    
    @IBAction func bubbleTouched(_ sender: Bubble) {
        score += sender.pointValue
        updateScore()
        sender.removeFromSuperview()
        let index = bubbleCollection.firstIndex(of: sender)
        bubbleCollection.remove(at: index!)
        //REMOVE FROM ARRAY
    }
}
