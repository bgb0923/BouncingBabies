//
//  Star.swift
//  StructureFire
//
//  Created by William Brancato on 12/26/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Star : SKNode {
    
    var image = SKSpriteNode(imageNamed: "Star")
    
    override init() {
        super.init()
        image.size = CGSize(width: image.size.width * 0.01, height: image.size.height * 0.01)
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spawn() {
        for _ in 0...100 {
            let newStar = Star()
            newStar.position.y = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.height))) / 2
            newStar.position.x = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width))) - (UIScreen.main.bounds.width / 2)
            self.addChild(newStar)
        }
    }
    
    func reset() {
        self.removeAllChildren()
        self.spawn()
    }
}
