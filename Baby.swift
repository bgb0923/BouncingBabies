//
//  Baby.swift
//  StructureFire
//
//  Created by William Brancato on 12/5/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Baby : SKNode {
    
    var image = SKSpriteNode(imageNamed: "Baby")
    var velocity  = 0
    var babyIdGen = 1
    var babyDict = [String: Baby]()
    
    override init() {
        super.init()
        image.size = CGSize(width: image.size.width * 0.025, height: image.size.height * 0.025)
        self.addChild(image)
        self.image.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // determine if new baby should be spawned
    func spawnDecision() {
        if self.babyDict.isEmpty {
            self.spawn()
        } else {
            let x = arc4random_uniform(150)
            if x == 5 {
                self.spawn()
            }
        }
    }
    
    // spawn new baby
    func spawn() {
        let newBaby = Baby()
        newBaby.name = String(babyIdGen)
        newBaby.image.isHidden = false
        newBaby.velocity = Int(arc4random_uniform(3)) + 5
        newBaby.position = CGPoint(x: -UIScreen.main.bounds.width / 3, y: UIScreen.main.bounds.height / 4.75)
        newBaby.physicsBody = SKPhysicsBody(circleOfRadius: image.size.height / 2)
        newBaby.physicsBody?.restitution = 1
        newBaby.physicsBody?.categoryBitMask = BabyCategory
        newBaby.physicsBody?.contactTestBitMask = TrampolineCategory | FloorCategory | BuildingCategory
        newBaby.physicsBody?.collisionBitMask = TrampolineCategory | FloorCategory | BuildingCategory
//        newBaby.physicsBody?.linearDamping = 100
        self.addChild(newBaby)
        self.babyDict[newBaby.name!] = newBaby
        babyIdGen += 1
    }
    
    // move the baby across the screen
    func move() {
        for (_,value) in self.babyDict {
            value.position.x += CGFloat(value.velocity)
        }
    }
    
    // handle if baby goes off screen
    func remove(_ config : Configuration) {
        for (_,value) in self.babyDict {
            if value.position.x > UIScreen.main.bounds.width / 2 + CGFloat(self.image.size.width) {
                value.removeFromParent()
                self.babyDict.removeValue(forKey: value.name!)
                config.score += 1
            }
        }
    }
    
    func reset() {
        self.removeAllChildren()
        self.babyDict.removeAll()
    }
}
