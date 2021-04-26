//
//  Bubble.swift
//  Bubble Pop
//
//  Created by Krystof Pavlis on 26/4/21.
//

import UIKit

class Bubble: UIButton {
    
    let xPos: Int
    let yPos: Int
    
    override init(frame: CGRect) {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.xPos = Int.random(in: 30...Int(screenWidth) - 30)
        self.yPos = Int.random(in: 100...Int(screenHeight) - 100)
        
        super.init(frame: frame)
        
        self.backgroundColor = .red
        self.frame = CGRect(x: xPos, y: yPos, width: 50, height: 50)
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animation() {
        
    }
    
    
}
