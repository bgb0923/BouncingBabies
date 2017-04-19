//
//  PowerUp_DoubleSize.swift
//  StructureFire
//
//  Created by William Brancato on 12/15/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpSizeUp: PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_Yellow"))
        print("Size Up")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        scene.gameWorld.player.trampoline.image.size.width *= 1.25
    }
}
