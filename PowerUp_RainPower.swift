//
//  PowerUp_RainPower.swift
//  StructureFire
//
//  Created by William Brancato on 12/17/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpRainPower: PowerUp {
    
    init() {
        super.init(image: SKSpriteNode(imageNamed: "PowerUp_Gray"))
        print("Rain Power")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func power(scene: SKSceneAddOn) {
        let wait = SKAction.wait(forDuration: 0.5)
        let drop = SKAction.run{scene.gameWorld.powerUpGenerator.generate(powerDecide: true)}
        scene.gameWorld.run(SKAction.sequence([wait,drop, //1
                                          wait,drop, //2
                                          wait,drop, //3
                                          wait,drop, //4
                                          wait,drop, //5
                                          wait,drop, //6
                                          wait,drop, //7
                                          wait,drop, //8
                                          wait,drop, //9
                                          wait,drop, //10
                                          wait,drop, //11
                                          wait,drop, //12
                                          wait,drop, //13
                                          wait,drop, //14
                                          wait,drop, //15
                                          wait,drop, //16
                                          wait,drop, //17
                                          wait,drop, //18
                                          wait,drop, //19
                                          wait,drop])) //20
    }
}
