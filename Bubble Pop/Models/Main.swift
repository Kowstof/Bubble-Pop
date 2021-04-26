//
//  Game.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 24/4/21.
//

import Foundation

struct Player {
    let name: String
    var highScore: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
//    func getName() -> String {
//        return name
//    }
//
//    func getHighScore() -> Int {
//        return highScore
//    }
    
    mutating func setHighScore(newHighScore: Int) {
        highScore = newHighScore
    }

}

struct Bubblee {
    let colour: String
    
    init(colour: String) {
        self.colour = colour
    }
}

struct Game {
    var gameDuration: Int = 60
    var maxBubbles: Int = 15
    var score: Int = 0
    let player: Player
    
//    func getGameDuration() -> Int {
//        return gameDuration
//    }
//
//    func getMaxBubbles() -> Int {
//        return maxBubbles
//    }
    
    init(player: Player) {
        self.player = player
    }
    
    mutating func setgameDuration(newDuration: Int) {
        gameDuration = newDuration
    }
    
    mutating func setMaxBubbles(newMaxBubbles: Int) {
        maxBubbles = newMaxBubbles
    }
    
    mutating func addToScore(amount: Int) {
        score += amount
    }
}

struct Leaderboard {
    var players = [Player]()
}

enum colours {
    case red, pink, green, blue, black
}
