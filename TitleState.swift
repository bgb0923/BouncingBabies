//
//  titleState.swift
//  StructureFire
//
//  Created by William Brancato on 12/23/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class TitleState : SKNode {
    
    var bouncingLabel = SKLabelNode(text: "BOUNCING")
    var babiesLabel = SKLabelNode(text: "BABIES")
    var startGameLabel = SKLabelNode(text: "START GAME")
    var howToLabel = SKLabelNode(text: "HOW TO PLAY")
    let floor = SKNode()
    
    override init() {
        super.init()
        
        // add the bouncing label
        self.bouncingLabel.fontColor = UIColor.white
        self.bouncingLabel.fontName = "chalkduster"
        self.bouncingLabel.fontSize = 65
        self.bouncingLabel.position = CGPoint(x: self.bouncingLabel.position.x - self.bouncingLabel.frame.width / 2.8, y: UIScreen.main.bounds.size.height)
        self.bouncingLabel.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.bouncingLabel.frame.size.width, height: self.bouncingLabel.frame.size.height))
        self.bouncingLabel.physicsBody?.isDynamic = true
        self.bouncingLabel.physicsBody?.restitution = 0.75
        self.addChild(bouncingLabel)
        
        // add the babies label
        self.babiesLabel.fontColor = UIColor.white
        self.babiesLabel.fontName = "chalkduster"
        self.babiesLabel.fontSize = 65
        self.babiesLabel.position = CGPoint(x: self.babiesLabel.position.x + self.babiesLabel.frame.width / 1.2, y: UIScreen.main.bounds.size.height * 1.25)
        self.babiesLabel.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.babiesLabel.frame.size.width, height: self.babiesLabel.frame.size.height))
        self.babiesLabel.physicsBody?.isDynamic = true
        self.babiesLabel.physicsBody?.restitution = 0.75
        self.addChild(babiesLabel)
        
        // add the floor
        self.floor.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 2000, height: 20))
        self.floor.position = CGPoint(x: 0, y: 0)
        floor.physicsBody?.isDynamic = false
        self.addChild(floor)
        
        // add the start game label
        self.startGameLabel.fontColor = UIColor.white
        self.startGameLabel.fontName = "chalkduster"
        self.startGameLabel.fontSize = 40
        self.startGameLabel.position.y = CGFloat(self.startGameLabel.position.y - self.startGameLabel.frame.height * 3)
        self.addChild(startGameLabel)

        // add the start game label
        self.howToLabel.fontColor = UIColor.white
        self.howToLabel.fontName = "chalkduster"
        self.howToLabel.fontSize = 40
        self.howToLabel.position.y = CGFloat(self.startGameLabel.position.y - self.startGameLabel.frame.height * 1.5)
        self.addChild(howToLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startGame(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.startGameLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "startGame", scene: scene)
        }
    }
    
    func howToPlay(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.howToLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.gameWorld.config.gameStateManager(value: "howTo", scene: scene)
        }
    }
    
    func reset() {
        self.bouncingLabel.position.y = UIScreen.main.bounds.height * 1.5
        self.babiesLabel.position.y = UIScreen.main.bounds.height
    }
    
}
