//
//  Cloud_Main.swift
//  StructureFire
//
//  Created by William Brancato on 12/15/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Cloud : SKNode {
    
    var vertical = true
    var horizontal = true
    var verticalCounter : UInt32 = 0
    var horizontalCounter : UInt32 = 5
    var swayBool = true
    var swayNum = 0
    
    init(image: SKSpriteNode, location: CGPoint) {
        super.init()
        self.addChild(image)
        image.position = location
        image.size = CGSize(width: image.size.width * 0.075, height: image.size.height * 0.075)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func sway(offset: UInt32) {
        
        if self.swayNum % 8 == 0 {
            if swayBool {
                self.verticalCounter = self.verticalCounter + offset
                self.horizontalCounter = self.horizontalCounter + offset
                swayBool = false
            }
            if self.vertical == true {
                self.position.y += 0.25
                self.verticalCounter += 1
                if self.verticalCounter % 10 == 0 {
                    self.vertical = false
                }
            } else {
                self.position.y -= 0.25
                self.verticalCounter += 1
                if self.verticalCounter % 10 == 0 {
                    self.vertical = true
                }
            }
            if self.horizontal == true {
                self.position.x += 0.25
                self.horizontalCounter += 1
                if self.horizontalCounter % 10 == 0 {
                    self.horizontal = false
                }
            } else {
                self.position.x -= 0.25
                self.horizontalCounter += 1
                if self.horizontalCounter % 10 == 0 {
                    self.horizontal = true
                }
            }
        }
        self.swayNum += 1
    }
}
