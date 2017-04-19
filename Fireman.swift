//
//  Fireman.swift
//  StructureFire
//
//  Created by William Brancato on 12/7/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Fireman : SKNode {

    var imageTrampNormal = SKSpriteNode(imageNamed: "Fireman_Tramp_Normal")
    var imageTrampUp = SKSpriteNode(imageNamed: "Fireman_Tramp_Up")
    
    init(startingPosition: CGPoint) {
        super.init()
        self.position = startingPosition
        self.imageTrampNormal.size = CGSize(width: imageTrampNormal.size.width * 0.05, height: imageTrampNormal.size.height * 0.05)
        self.imageTrampUp.size = CGSize(width: imageTrampUp.size.width * 0.05, height: imageTrampUp.size.height * 0.05)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: imageTrampNormal.size.width, height: imageTrampNormal.size.height))
        self.physicsBody?.restitution = 0.1
        self.physicsBody?.categoryBitMask = FiremanCategory
        self.physicsBody?.contactTestBitMask = FloorCategory
        self.physicsBody?.collisionBitMask = FloorCategory
        self.physicsBody?.linearDamping = 2
        self.addChild(imageTrampNormal)
        self.addChild(imageTrampUp)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
