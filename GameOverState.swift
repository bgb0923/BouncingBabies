//
//  GameOverState.swift
//  StructureFire
//
//  Created by William Brancato on 12/23/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverState : SKNode {
    
    var gameOverLabel = SKLabelNode(text: "GAME OVER")
    var titleLabel = SKLabelNode(text: "BACK TO TITLE SCREEN")
    var newGameLabel = SKLabelNode(text: "NEW GAME")
    var scoreLabel = SKLabelNode(text: "SCORE: 0")
    
    override init() {
        super.init()
        
        // add the game over label
        self.gameOverLabel.fontColor = UIColor.white
        self.gameOverLabel.fontName = "chalkduster"
        self.gameOverLabel.fontSize = 100
        self.gameOverLabel.position.y = CGFloat(self.gameOverLabel.position.y + self.gameOverLabel.frame.height)
        self.addChild(gameOverLabel)
        
        
        // add the new game label
        self.newGameLabel.fontColor = UIColor.white
        self.newGameLabel.fontName = "chalkduster"
        self.newGameLabel.fontSize = 50
        self.newGameLabel.position.y = CGFloat(self.gameOverLabel.position.y - self.gameOverLabel.frame.height * 2)
        self.addChild(newGameLabel)
        
        // add the title screen label
        self.titleLabel.fontColor = UIColor.white
        self.titleLabel.fontName = "chalkduster"
        self.titleLabel.fontSize = 50
        self.titleLabel.position.y = CGFloat(self.gameOverLabel.position.y - self.gameOverLabel.frame.height * 2 - self.newGameLabel.frame.height * 1.5)
        self.addChild(titleLabel)
        
        // add the score label
        self.scoreLabel.fontColor = UIColor.white
        self.scoreLabel.fontName = "chalkduster"
        self.scoreLabel.fontSize = 50
        self.scoreLabel.position = CGPoint(x: 0, y: 0)
        self.addChild(scoreLabel)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func newGame(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.newGameLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "newGame", scene: scene)
        }
    }
    
    func titleScreen(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.titleLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "backToTitle", scene: scene)
        }
    }
    
    func setScore(config: Configuration) {
        for x in 0...config.score {
            self.scoreLabel.text = "SCORE: \(config.finalScore - (config.score - x))"
        }
    }
}
