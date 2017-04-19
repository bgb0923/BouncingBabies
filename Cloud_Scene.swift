//
//  Cloud.swift
//  StructureFire
//
//  Created by William Brancato on 12/15/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class CloudScene : SKNode {
    
    var bottomLeftCloud = Cloud(image: SKSpriteNode(imageNamed: "Cloud_1"), location: CGPoint(x: -UIScreen.main.bounds.width / 10.2, y: UIScreen.main.bounds.height / 10.2))
    var topLeftCloud = Cloud(image: SKSpriteNode(imageNamed: "Cloud_2"), location: CGPoint(x: -UIScreen.main.bounds.width / 4.2, y: UIScreen.main.bounds.height / 3.2))
    var topMiddleCloud = Cloud(image: SKSpriteNode(imageNamed: "Cloud_3"), location: CGPoint(x: UIScreen.main.bounds.width / 14.5, y: UIScreen.main.bounds.height / 2.4))
    var topRightCloud = Cloud(image: SKSpriteNode(imageNamed: "Cloud_4"), location: CGPoint(x: UIScreen.main.bounds.width / 2.7, y:UIScreen.main.bounds.height / 3.2))
    var bottomRightCloud = Cloud(image: SKSpriteNode(imageNamed: "Cloud_5"), location: CGPoint(x: UIScreen.main.bounds.width / 5.0, y:UIScreen.main.bounds.height / 10.2))
    
    override init() {
        super.init()
        self.addChild(bottomLeftCloud)
        self.addChild(topLeftCloud)
        self.addChild(topMiddleCloud)
        self.addChild(topRightCloud)
        self.addChild(bottomRightCloud)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
