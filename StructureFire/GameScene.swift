//
//  GameScene.swift
//  StructureFire
//
//  Created by William Brancato on 12/5/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene : SKSceneAddOn, SKPhysicsContactDelegate {

    var cry = Sound("Cry")
    var boing = Sound("Boing")
    
    override func didMove(to view: SKView) {
        
        // set basic properties
        anchorPoint = CGPoint(x: 0.5, y:0.5)
        backgroundColor = UIColor.black
        
        // load the game
        self.gameWorld.config.gameStateManager(value: "title", scene: self)
        
        self.howToScreen.isHidden = true
        self.addChild(howToScreen)
    }
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.gameWorld.config.howToStateActive == true {
            self.howToScreen.back(touchLocation: (touches.first?.location(in: self))!, scene: self)
        } else if self.gameWorld.config.levelStateActive == true {
            self.gameWorld.hud.pauseButton.pause(touchLocation: (touches.first?.location(in: self))!, scene: self)
            self.gameWorld.player.move(touchLocation: (touches.first?.location(in: self))!)
        } else if self.gameWorld.config.pauseStateActive == true {
            self.pauseScreen.resume(touchLocation: (touches.first?.location(in: self))!, scene: self)
            self.pauseScreen.restart(touchLocation: (touches.first?.location(in: self))!, scene: self)
            self.pauseScreen.howToPlay(touchLocation: (touches.first?.location(in: self))!, scene: self)
        } else if self.gameWorld.config.startUpStateActive == true {
            self.titleScreen.startGame(touchLocation: (touches.first?.location(in: self))!, scene: self)
            self.titleScreen.howToPlay(touchLocation: (touches.first?.location(in: self))!, scene: self)
        } else if self.gameWorld.config.gameOverStateActive == true {
            self.gameOverScreen.newGame(touchLocation: (touches.first?.location(in: self))!, scene: self)
            self.gameOverScreen.titleScreen(touchLocation: (touches.first?.location(in: self))!, scene: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.gameWorld.player.move(touchLocation: (touches.first?.location(in: self))!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        // size the player
        self.gameWorld.player.reSize()
        
        // handle baby movement
        if self.gameWorld.config.dropSwitch == true {
            
            // handle baby movement
            self.gameWorld.babies.spawnDecision()
            self.gameWorld.babies.move()
            self.gameWorld.babies.remove(gameWorld.config)
            
            // generate power ups
            self.gameWorld.powerUpGenerator.generate(powerDecide: false)
            
        } else if self.gameWorld.player.position.x - self.gameWorld.player.trampoline.image.size.width / 2 < self.gameWorld.dropSwitchLabel1.position.x {
            self.gameWorld.config.dropSwitch = true
            self.gameWorld.dropSwitchLabel1.isHidden = true
            self.gameWorld.dropSwitchLabel2.isHidden = true
        }
    
        // update the score
        self.gameWorld.hud.scoreBar.updateScore(gameWorld.config)
        
        // animate the building
        self.gameWorld.building.burn()
        
        // move the clouds - need to condense this to iterate through a loop
        self.gameWorld.clouds.bottomLeftCloud.sway(offset: arc4random_uniform(10) + 1)
        self.gameWorld.clouds.topLeftCloud.sway(offset: arc4random_uniform(10) + 1)
        self.gameWorld.clouds.topMiddleCloud.sway(offset: arc4random_uniform(10) + 1)
        self.gameWorld.clouds.topRightCloud.sway(offset: arc4random_uniform(10) + 1)
        self.gameWorld.clouds.bottomRightCloud.sway(offset: arc4random_uniform(10) + 1)
        
        if self.gameWorld.config.gameOverStateActive == true {
            self.gameOverScreen.setScore(config: self.gameWorld.config)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == BabyCategory) && (contact.bodyB.categoryBitMask == FloorCategory) {
            self.gameWorld.babies.babyDict.removeValue(forKey: String((contact.bodyA.node?.name)!))
            contact.bodyA.node?.removeFromParent()
            self.cry.play()
            self.gameWorld.config.nrLives = gameWorld.hud.lifeBar.incrementLives(scene: self, increment: -1)
        } else if (contact.bodyA.categoryBitMask == FloorCategory) && (contact.bodyB.categoryBitMask == BabyCategory)  {
            self.gameWorld.babies.babyDict.removeValue(forKey: String((contact.bodyB.node?.name)!))
            contact.bodyB.node?.removeFromParent()
            self.gameWorld.config.nrLives = gameWorld.hud.lifeBar.incrementLives(scene: self, increment: -1)
            self.cry.play()
        } else if (contact.bodyA.categoryBitMask == PowerUpCategory) && (contact.bodyB.categoryBitMask == TrampolineCategory) {
            contact.bodyA.node?.removeFromParent()
            self.gameWorld.powerUpGenerator.executePower(name: (contact.bodyA.node?.name)!, scene: self)
            self.gameWorld.powerUpGenerator.powerUpDict.removeValue(forKey: String((contact.bodyA.node?.name)!))
        } else if (contact.bodyA.categoryBitMask == TrampolineCategory) && (contact.bodyB.categoryBitMask == PowerUpCategory)  {
            contact.bodyB.node?.removeFromParent()
            self.gameWorld.powerUpGenerator.executePower(name: (contact.bodyB.node?.name)!, scene: self) // this is the row that causes the program to crash
            self.gameWorld.powerUpGenerator.powerUpDict.removeValue(forKey: String((contact.bodyB.node?.name)!))
        } else if (contact.bodyA.categoryBitMask == PowerUpCategory) && (contact.bodyB.categoryBitMask == FloorCategory)  {
            contact.bodyA.node?.removeFromParent()
            self.gameWorld.powerUpGenerator.powerUpDict.removeValue(forKey: String((contact.bodyB.node?.name)!))
        } else if (contact.bodyA.categoryBitMask == FloorCategory) && (contact.bodyB.categoryBitMask == PowerUpCategory)  {
            contact.bodyB.node?.removeFromParent()
            self.gameWorld.powerUpGenerator.powerUpDict.removeValue(forKey: String((contact.bodyB.node?.name)!))
        } else if (contact.bodyA.categoryBitMask == BabyCategory) && (contact.bodyB.categoryBitMask == TrampolineCategory)  {
            self.boing.play()
        } else if (contact.bodyA.categoryBitMask == TrampolineCategory) && (contact.bodyB.categoryBitMask == BabyCategory)  {
            self.boing.play()
        }
    }
}
