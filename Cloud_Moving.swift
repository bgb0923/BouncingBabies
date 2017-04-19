//
//  Cloud.swift
//  StructureFire
//
//  Created by William Brancato on 12/10/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class MovingCloud : SKNode {
    
    var velocity = 0
    var cloudDict = [String: MovingCloud]()
    var cloudIdGen = 1
    var image2 = SKSpriteNode(imageNamed: "cloud1")
    
    override init() {
        super.init()
        let x = arc4random_uniform(5) + 1
        let image = SKSpriteNode(imageNamed: "cloud\(x)")
        self.addChild(image)
        image.size = CGSize(width: image.size.width * 0.075, height: image.size.height * 0.075)
        image2.size = CGSize(width: image2.size.width * 0.075, height: image2.size.height * 0.075)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // determine if new cloud should be spawned
    func spawnDecision() {
        if self.cloudDict.count < 3 {
            self.spawn()
        } else {
            let a = arc4random_uniform(200)
            if a == 5 {
                self.spawn()
            }
        }
    }
    
    // spawn new cloud
    func spawn() {
        let b = arc4random_uniform(3)
        var c = 0.0
        if b == 0 {
            c = 1.5
        } else if b == 1 {
            c = 3
        } else {
            c = 6
        }
        let newCloud = MovingCloud()
        newCloud.name = String(cloudIdGen)
        newCloud.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: (UIScreen.main.bounds.height / 2) / CGFloat(c))
        newCloud.velocity = Int(arc4random_uniform(3) + 1)
        self.addChild(newCloud)
        self.cloudDict[newCloud.name!] = newCloud
        cloudIdGen += 1
    }
    
    //move clouds across the screen
    func move() {
        for (_,value) in self.cloudDict {
            value.position.x -= CGFloat(value.velocity)
        }
    }
    
    
    // handle if cloud goes off screen
    func remove() {
        for (_,value) in self.cloudDict {
            if value.position.x < ((-UIScreen.main.bounds.width / 2) - CGFloat(image2.size.width) / 2) {
                value.removeFromParent()
                self.cloudDict.removeValue(forKey: value.name!)
            }
        }
    }
    
}
