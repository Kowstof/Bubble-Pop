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
        initialBubbleSpawn()
        startTimer()
        updateScore()
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
            self.spawnBubbles()

            self.despawnBubbles()
            
            if self.timeRemaining == 0 {
                timer.invalidate()
            }
        }
    }
    
    @discardableResult func tryMakeBubble() -> Bool {
        var touching = false
        let newBubble = Bubble()
        
        for bubble in bubbleCollection {
            if newBubble.frame.intersects(bubble.frame) {
                touching = true
            }
        }
        
        if !touching {
            newBubble.addTarget(self, action: #selector(bubbleTouched), for: .touchUpInside)
            self.view.addSubview(newBubble)
            bubbleCollection.append(newBubble)
            return true
        } else {
            return false
        }
    }
    
    func initialBubbleSpawn() {
        while bubbleCollection.count < maxBubbles {
            tryMakeBubble()
        }
    }
    
    // randomly adds between 1 and 5 new bubbles. Checks to make sure it doesn't exceed the specified max bubble limit.
    @objc func spawnBubbles() {
        let difference = maxBubbles - bubbleCollection.count
        var maxNewBubbles: Int
        var bubblesMade = 0
        
        if difference < 4 {
            maxNewBubbles = difference + 1
        } else {
            maxNewBubbles = 5
        }
        
        for num in 0...maxNewBubbles {
            while bubblesMade < num { // if a bubble overlaps, it's not made. this will keep trying until the required number is met
                let success = tryMakeBubble()
                if success {
                    bubblesMade += 1
                }
            }
            
        }
    }
    
    //removes between 1 and 3 bubbles using a random index from the view. It also checks to make sure it's not removing more bubbles than there are on the screen
    @objc func despawnBubbles() {
        var maxBubblesToRemove: Int
        
        if bubbleCollection.count < 3 {
            maxBubblesToRemove = bubbleCollection.count
        } else {
            maxBubblesToRemove = 3
        }
        
        for _ in 1...maxBubblesToRemove {
            let bubbleToRemove = bubbleCollection[Int.random(in: 0...bubbleCollection.count - 1)]
            removeBubble(bubble: bubbleToRemove)
        }
    }
    
    func removeBubble(bubble: Bubble) {
        let index = bubbleCollection.firstIndex(of: bubble)
        bubbleCollection.remove(at: index!)
        bubble.removeFromSuperview()
    }
    
    @IBAction func bubbleTouched(_ sender: Bubble) {
        score += sender.pointValue
        updateScore()
        removeBubble(bubble: sender)
    }
}
