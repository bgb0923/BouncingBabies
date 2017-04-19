//
//  PowerUp_TrampolineUp.swift
//  StructureFire
//
//  Created by William Brancato on 12/17/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpTrampolineUp : PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_Orange"))
        print("Trampoline Up")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        if scene.gameWorld.player.trampolinePositionY != 1 {
            scene.gameWorld.player.trampolinePositionY += 1
        }
    }
}
