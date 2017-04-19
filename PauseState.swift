//
//  PauseState.swift
//  StructureFire
//
//  Created by William Brancato on 12/21/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PauseState : SKNode {
    
    var pausedLabel = SKLabelNode(text: "PAUSED")
    var resumeLabel = SKLabelNode(text: "RESUME")
    var restartLabel = SKLabelNode(text: "RESTART")
    var dividerLabel = SKLabelNode(text: "|")
    var howToPlayLabel = SKLabelNode(text: "HOW TO PLAY")
    
    
    override init() {
        super.init()
        self.zPosition = 90
        
        // add the pause label
        self.pausedLabel.fontColor = UIColor.white
        self.pausedLabel.fontName = "chalkduster"
        self.pausedLabel.fontSize = 100
        self.pausedLabel.position.y = CGFloat(self.pausedLabel.position.y + self.pausedLabel.frame.height)
        self.addChild(pausedLabel)
        
        // add the divider label
        self.dividerLabel.fontColor = UIColor.white
        self.dividerLabel.fontName = "chalkduster"
        self.dividerLabel.fontSize = 50
        self.dividerLabel.position.y = CGFloat(self.pausedLabel.position.y - self.pausedLabel.frame.height * 2)
        self.addChild(dividerLabel)
        
        // add the restart label
        self.resumeLabel.fontColor = UIColor.white
        self.resumeLabel.fontName = "chalkduster"
        self.resumeLabel.fontSize = 50
        self.resumeLabel.position = CGPoint(x: self.pausedLabel.position.x - self.pausedLabel.frame.width / 2.75, y: self.pausedLabel.position.y - self.pausedLabel.frame.height * 2)
        self.addChild(resumeLabel)
        
        // add the resume label
        self.restartLabel.fontColor = UIColor.white
        self.restartLabel.fontName = "chalkduster"
        self.restartLabel.fontSize = 50
        self.restartLabel.position = CGPoint(x: self.pausedLabel.position.x + self.pausedLabel.frame.width / 2.35, y: self.pausedLabel.position.y - self.pausedLabel.frame.height * 2)
        self.addChild(restartLabel)
        
        // add the how to play label
        
        self.howToPlayLabel.fontColor = UIColor.white
        self.howToPlayLabel.fontName = "chalkduster"
        self.howToPlayLabel.fontSize = 50
        self.howToPlayLabel.position = CGPoint(x: self.dividerLabel.position.x + self.howToPlayLabel.frame.height / 2, y: self.resumeLabel.position.y - self.pausedLabel.frame.height)
        self.addChild(howToPlayLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resume(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.resumeLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "resume", scene: scene)
        }
    }
    
    func restart(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.restartLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "restart", scene: scene)
        }
    }
    
    func howToPlay(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.howToPlayLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "howTo", scene: scene)
        }
    }
}
