//
//  PowerUp_DropTrampoline.swift
//  StructureFire
//
//  Created by William Brancato on 12/17/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpTrampolineDown : PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_Aqua"))
        print("Trampoline Down")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        if scene.gameWorld.player.trampolinePositionY == 1 {
            scene.gameWorld.player.trampolinePositionY -= 1
        }
    }
}
