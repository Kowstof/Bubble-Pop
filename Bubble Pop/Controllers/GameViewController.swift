//
//  GameViewController.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit

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
    var playerScores: [[String]] = []
    var previousBubble: Bubble = Bubble()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initHighScore()
        initialBubbleSpawn()
        startTimer()
        updateScore()
    }
    
    func initHighScore() {
        var scores: [Int] = []
        var highscore = 0
        
        if let playerData = UserDefaults.standard.value(forKey: "playerScores") as? [[String]] {
            self.playerScores = playerData
        }
        
        for player in playerScores {
            let score = Int(player[1])
            scores.append(score!)
        }
        
        highscore = scores.max() ?? 0
        highScore = highscore
    }
    
    func updateScore() {
        scoreText.text = String(score)
        highScoreText.text = String(highScore)
        
        if score > highScore {
            highScoreText.text = String(score)
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
                self.saveScore()
                self.performSegue(withIdentifier: "goToEnd", sender: nil)
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
            newBubble.popInAnimation()
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
        
        for _ in 0...maxBubblesToRemove {
            let bubbleToRemove = bubbleCollection[Int.random(in: 0...bubbleCollection.count - 1)]
            removeBubble(bubble: bubbleToRemove)
        }
    }
    
    func removeBubble(bubble: Bubble) {
        let index = bubbleCollection.firstIndex(of: bubble)
        bubbleCollection.remove(at: index!)
        bubble.popOutAnimation()
        bubble.removeFromSuperview()
    }
    
    @IBAction func bubbleTouched(_ sender: Bubble) {
        
        if previousBubble.backgroundColor == sender.backgroundColor { // checks if this bubble is the same as the previous
            score += Int(round(Float(sender.pointValue) * 1.5))
        } else {
            score += sender.pointValue
        }
        
        updateScore()
        previousBubble = sender // sets previous bubble to the one currently tapped on
        removeBubble(bubble: sender)
    }
    
    func saveScore() {
        let newScore: [String] = [name, String(score)]
        playerScores.append(newScore)
        UserDefaults.standard.set(playerScores, forKey: "playerScores")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //passes data to the game end screen
        if segue.identifier == "goToEnd" {
            let vc = segue.destination as! EndScreenViewController
            vc.name = name
            vc.score = score
            vc.highscore = highScore
        }
    }
}
