//
//  Trampoline.swift
//  StructureFire
//
//  Created by William Brancato on 12/5/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Trampoline : SKNode {
    
    var image = SKSpriteNode(imageNamed: "Concrete")
    
    override init() {
        super.init()
//        image.size = CGSize(width: UIScreen.main.bounds.width / 6, height: 20)
        self.createPhysicsBody()
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPhysicsBody() {
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: image.size.width, height: image.size.height))
        self.physicsBody?.categoryBitMask = TrampolineCategory
        self.physicsBody?.contactTestBitMask = FloorCategory | BabyCategory | PowerUpCategory
        self.physicsBody?.collisionBitMask = FloorCategory | BabyCategory | PowerUpCategory
        self.physicsBody?.isDynamic = false
    }
    
    func reset() {
        self.image.size = CGSize(width: UIScreen.main.bounds.width / 6, height: 5)
    }
}
