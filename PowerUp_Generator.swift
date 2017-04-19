//
//  PowerUp_Generator.swift
//  StructureFire
//
//  Created by William Brancato on 12/16/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUpGenerator : SKNode {
    
    var powerUpDict = [String : PowerUp]()
    var powerUpIdGen = 1
    var powerId : UInt32 = 0
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // generate a power
    func generate(powerDecide : Bool) {
        if powerDecide == true {
            self.powerId = arc4random_uniform(9)
        } else {
            self.powerId = arc4random_uniform(1800)
        }
        switch self.powerId {
        case 0:
            self.assign(power: PowerUpSizeUp())
        case 1:
            self.assign(power: PowerUpSizeDown())
        case 2:
            self.assign(power: PowerUpLifeUp())
        case 3:
            self.assign(power: PowerUpLifeDown())
        case 4:
            self.assign(power: PowerUpTrampolineUp())
        case 5:
            self.assign(power: PowerUpTrampolineDown())
        case 6:
            self.assign(power: PowerUpDropAnother())
        case 7:
            self.assign(power: PowerUpRainPower())
        case 8:
            self.assign(power: PowerUpRandomPower())
        default:
            let _ = 5
        }
    }
    
    func assign(power: PowerUp) {
        power.name = String(powerUpIdGen)
        self.addChild(power)
        self.powerUpDict[power.name!] = power
        powerUpIdGen += 1
    }
    
    func executePower(name: String, scene: SKSceneAddOn){
        for (key, value) in self.powerUpDict {
            if key == name {
                value.power(scene: scene)
            }
        }
    }
    
    func reset() {
        self.removeAllChildren()
        self.powerUpDict.removeAll()
    }
}
