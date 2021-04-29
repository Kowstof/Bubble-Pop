//
//  Bubble.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit
import CoreGraphics

class Bubble: UIButton {
    
    let xPos: Int
    let yPos: Int
    var pointValue = 0
    
    override init(frame: CGRect) {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.xPos = Int.random(in: 10...Int(screenWidth) - 80)
        self.yPos = Int.random(in: 140...Int(screenHeight) - 180)
        
        super.init(frame: frame)
        
        self.backgroundColor = setColour()
        self.frame = CGRect(x: xPos, y: yPos, width: 70, height: 70)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation() {
        
    }
    
    func setColour() -> UIColor {
        let num = Int.random(in: 1...100)
        
        if num <= 5 {
            pointValue = 10
            return UIColor.BubbleColours.black
        }
        else if num <= 15 {
            pointValue = 8
            return UIColor.BubbleColours.blue
        }
        else if num <= 30 {
            pointValue = 5
            return UIColor.BubbleColours.green
        }
        else if num <= 60 {
            pointValue = 2
            return UIColor.BubbleColours.pink
        }
        else {
            pointValue = 1
            return UIColor.BubbleColours.red
        }
    }
}

// Credit for custom colour extension implementation: https://stackoverflow.com/a/40743337

extension UIColor {
    struct BubbleColours {
        static var red: UIColor {return UIColor(red: 0.90, green: 0.40, blue: 0.40, alpha: 1.00)}
        static var pink: UIColor {return UIColor(red: 0.97, green: 0.56, blue: 0.70, alpha: 1.00)}
        static var green: UIColor {return UIColor(red: 0.02, green: 0.77, blue: 0.42, alpha: 1.00)}
        static var blue: UIColor {return UIColor(red: 0.33, green: 0.43, blue: 0.90, alpha: 1.00)}
        static var black: UIColor {return UIColor(red: 0.19, green: 0.22, blue: 0.32, alpha: 1.00)}
    }
}
