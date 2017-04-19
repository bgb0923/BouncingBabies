//
//  Building.swift
//  StructureFire
//
//  Created by William Brancato on 12/10/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Building : SKNode {
    
    let image1 = SKSpriteNode(imageNamed: "Building_1")
    let image2 = SKSpriteNode(imageNamed: "Building_2")
    let image3 = SKSpriteNode(imageNamed: "Building_3")
    let image4 = SKSpriteNode(imageNamed: "Building_4")
    var imageSwitch = 0
    
    override init() {
        super.init()
        
        self.positionImage(image: image1)
        self.image1.isHidden = false
        self.addChild(image1)

        self.positionImage(image: image2)
        self.addChild(image2)

        self.positionImage(image: image3)
        self.addChild(image3)

        self.positionImage(image: image4)
        self.addChild(image4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func positionImage(image: SKSpriteNode) {
        image.size = CGSize(width: image.size.width * 0.17, height: image.size.height * 0.21)
        image.position = CGPoint(x: -UIScreen.main.bounds.width / 2 + image.size.width / 3.5, y: -UIScreen.main.bounds.height / 2 + image.size.height / 2.25)
        image.isHidden = true
    }
    
    func burn() {
        self.imageSwitch += 1
        if self.imageSwitch % 8 == 0 {
            let temp = self.image1.isHidden
            self.image1.isHidden = self.image2.isHidden
            self.image2.isHidden = self.image3.isHidden
            self.image3.isHidden = self.image4.isHidden
            self.image4.isHidden = temp
        }
    }
    
}
