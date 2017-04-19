//
//  PowerUp_Main.swift
//  StructureFire
//
//  Created by William Brancato on 12/15/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PowerUp : SKNode {
    
    init(image: SKSpriteNode) {
        super.init()
        
        let x = arc4random_uniform(2)
        var y = 0
        if x == 0 {
            y = 1
        } else {
            y = -1
        }
        
        image.size = CGSize(width: image.size.width * 0.025, height: image.size.height * 0.025)
        self.position = CGPoint(x: (CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)) / 2) * CGFloat(y)), y: UIScreen.main.bounds.height / 2 + image.size.height)
        self.physicsBody = SKPhysicsBody(circleOfRadius: image.size.width / 4) //SKPhysicsBody(texture: image.texture!, size: image.size)
        self.physicsBody?.categoryBitMask = PowerUpCategory
        self.physicsBody?.contactTestBitMask = TrampolineCategory | FloorCategory
        self.physicsBody?.collisionBitMask = TrampolineCategory | FloorCategory
        self.physicsBody?.linearDamping = 15 //CGFloat(arc4random_uniform(15) + 5)
        self.zPosition = 100
        self.addChild(image)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func power(scene: SKSceneAddOn) {
    }
}
