//
//  PowerUp_SizeDown.swift
//  StructureFire
//
//  Created by William Brancato on 12/16/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpSizeDown : PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_Pink"))
        print("Size Down")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func power(scene: SKSceneAddOn) {
        scene.gameWorld.player.trampoline.image.size.width *= 0.75
    }
}
