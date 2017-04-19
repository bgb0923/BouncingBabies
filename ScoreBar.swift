//
//  ScoreBar.swift
//  StructureFire
//
//  Created by William Brancato on 12/9/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class ScoreBar : SKNode {
    
    var display = SKLabelNode()
    
    override init() {
        super.init()
        display.fontName = "Chalkduster"
        display.fontSize = 25
        self.addChild(display)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateScore(_ config: Configuration) {
        self.display.text = "\(config.score)"
    }
    
    
}
