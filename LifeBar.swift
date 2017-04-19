//
//  LifeBar.swift
//  StructureFire
//
//  Created by William Brancato on 12/9/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class LifeBar : SKNode {
    
    let life = SKSpriteNode(imageNamed: "Baby")
    
    override init() {
        super.init()
        life.size = CGSize(width: life.size.width * 0.015, height: life.size.height * 0.015)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // add the necessary number of lives to the life bar
    func drawLives(config: Configuration) {
        for x in 0..<config.nrLives {
            let livesSprite = SKSpriteNode(imageNamed: "Baby")
            livesSprite.name = "livesSprite\(x)"
            livesSprite.size = life.size
            livesSprite.position.x = livesSprite.position.x - (livesSprite.size.width * CGFloat(x))
            self.addChild(livesSprite)
        }
    }
    
    // remove a life when a baby hits the ground
    func incrementLives(scene: SKSceneAddOn, increment: Int) -> Int {
        scene.gameWorld.config.nrLives += increment
        if scene.gameWorld.config.nrLives > 0 {
            self.removeAllChildren()
            self.drawLives(config: scene.gameWorld.config)
        } else {
            scene.gameWorld.config.gameStateManager(value: "gameOver", scene: scene)
        }
        return scene.gameWorld.config.nrLives
    }
    
    func reset() {
        self.removeAllChildren()
    }
}
