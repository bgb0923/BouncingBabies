//
//  Player.swift
//  StructureFire
//
//  Created by William Brancato on 12/8/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class Player : SKNode {
    
    var rightFireman = Fireman(startingPosition: CGPoint(x: 100, y: UIScreen.main.bounds.height / 2))
    var leftFireman = Fireman(startingPosition: CGPoint(x: -100, y: UIScreen.main.bounds.height / 2))
    var trampoline = Trampoline()
    var trampolinePositionY = 0
    var trampolinePositionX : CGFloat = 0
    
    override init() {
        super.init()
        self.reSize()
        self.addChild(rightFireman)
        leftFireman.xScale = -1
        self.addChild(leftFireman)
        self.addChild(trampoline)
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    
    func move(touchLocation: CGPoint) {
        if self.calculateAccumulatedFrame().contains(touchLocation) {
            self.position.x = touchLocation.x
//            print("touchLocation: \(touchLoation)")
//            print("trampolinePositionX \(trampolinePositionX)")
//            print("selfPosition:\(self.position.x)")
//            if self.position.x == 0 {
//                self.position.x = touchLocation.x
//            } else {
//                self.position.x = touchLocation.x - (touchLocation.x - trampolinePositionX)
//            }
//            self.trampolinePositionX = self.position.x
        }
    }
    
    func reSize() {
        
        if self.trampolinePositionY == -1 {
            self.trampoline.position.y = rightFireman.position.y - rightFireman.imageTrampNormal.size.height / 2
        } else if self.trampolinePositionY == 1 {
            self.trampoline.position.y = rightFireman.position.y + rightFireman.imageTrampNormal.size.height / 2
            self.rightFireman.imageTrampNormal.isHidden = true
            self.rightFireman.imageTrampUp.isHidden = false
            self.leftFireman.imageTrampNormal.isHidden = true
            self.leftFireman.imageTrampUp.isHidden = false
        } else {
            self.trampoline.position.y = self.rightFireman.position.y
            self.rightFireman.imageTrampNormal.isHidden = false
            self.rightFireman.imageTrampUp.isHidden = true
            self.leftFireman.imageTrampNormal.isHidden = false
            self.leftFireman.imageTrampUp.isHidden = true
        }
        
        self.trampoline.createPhysicsBody()
        self.rightFireman.position.x = self.trampoline.position.x + self.trampoline.image.size.width / 2 + self.rightFireman.imageTrampNormal.size.width / 4
        self.leftFireman.position.x = self.trampoline.position.x - self.trampoline.image.size.width / 2 - self.leftFireman.imageTrampNormal.size.width / 4
    }
    
    func reset() {
        self.trampoline.reset()
        self.position.x = UIScreen.main.bounds.width / 4
        self.trampolinePositionY = 0
        rightFireman.position.y = UIScreen.main.bounds.height / 2
        leftFireman.position.y = UIScreen.main.bounds.height / 2
    }
}
