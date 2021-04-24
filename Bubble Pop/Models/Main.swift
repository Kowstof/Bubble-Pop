//
//  Game.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 24/4/21.
//

import Foundation

class Player {
    let name: String
    var highScore: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func getHighScore() -> Int {
        return highScore
    }
    
    func setHighScore(newHighScore: Int) {
        highScore = newHighScore
    }

}

class Bubble {
    let colour: String
    
    init(colour: String) {
        self.colour = colour
    }
}

class Game {
    var gameDuration: Int = 60
    var maxBubbles: Int = 15
    
    func getGameDuration() -> Int {
        return gameDuration
    }
    
    func getMaxBubbles() -> Int {
        return maxBubbles
    }
    
    func setgameDuration(newDuration: Int) {
        gameDuration = newDuration
    }
    
    func setMaxBubbles(newMaxBubbles: Int) {
        maxBubbles = newMaxBubbles
    }
}

enum colours {
    case red, pink, green, blue, black
}
