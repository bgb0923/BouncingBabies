//
//  PowerUp_Random.swift
//  StructureFire
//
//  Created by William Brancato on 12/17/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpRandomPower : PowerUp {
    
    var powerUpArray = [PowerUpDropAnother()
                       ,PowerUpLifeDown()
                       ,PowerUpLifeUp()
                       ,PowerUpSizeDown()
                       ,PowerUpSizeUp()
                       ,PowerUpTrampolineDown()
                       ,PowerUpTrampolineUp()
                       ,PowerUpRainPower()]
    
    init() {
        super.init(image: SKSpriteNode(imageNamed:"PowerUp_White"))
        print("Random Power")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        let x = Int(arc4random_uniform(UInt32(powerUpArray.count)))
        self.powerUpArray[x].power(scene: scene)
    }
}
