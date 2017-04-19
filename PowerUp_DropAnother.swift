//
//  PowerUp_Random.swift
//  StructureFire
//
//  Created by William Brancato on 12/17/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpDropAnother : PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_Purple"))
        print("Drop Another")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        scene.gameWorld.powerUpGenerator.generate(powerDecide: true)
    }
}
