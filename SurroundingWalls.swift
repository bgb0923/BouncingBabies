//
//  SurroundingWalls.swift
//  StructureFire
//
//  Created by William Brancato on 12/9/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class SurroundingWalls : SKNode {
    
    
    var concrete = SKSpriteNode(imageNamed: "Concrete")
    var floor = SKNode()
    
    override init() {
        super.init()
        
        // add the floor
        floor.position = CGPoint(x:0, y: -UIScreen.main.bounds.height / 2)
        self.concrete.position = self.floor.position
        self.concrete.size = CGSize(width: 5000, height: 20)
        floor.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 2000, height: 20))
        floor.physicsBody?.isDynamic = false
        floor.physicsBody?.categoryBitMask = FloorCategory
        self.addChild(floor)
        self.addChild(concrete)
        
        // add the building wall
        let buildingWall = SKNode()
        buildingWall.position.x = -UIScreen.main.bounds.width / 3
        buildingWall.position.y = 0
        buildingWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: 2000))
        buildingWall.physicsBody?.isDynamic = false
        buildingWall.physicsBody?.categoryBitMask = BuildingCategory
        self.addChild(buildingWall)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
