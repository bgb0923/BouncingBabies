//
//  PowerUp_LifeUp.swift
//  StructureFire
//
//  Created by William Brancato on 12/16/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpLifeUp: PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_Green"))
        print("Life Up")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        scene.gameWorld.config.nrLives = scene.gameWorld.hud.lifeBar.incrementLives(scene: scene, increment: 1)
    }
    
}
