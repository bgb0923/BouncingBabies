//
//  PauseButton.swift
//  StructureFire
//
//  Created by William Brancato on 12/20/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class PauseButton : SKNode {
    
    var image = SKSpriteNode(imageNamed: "Button_Pause")
    
    override init() {
        super.init()
        image.size = CGSize(width: image.size.width * 0.012, height: image.size.height * 0.012)
        self.addChild(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pause(touchLocation: CGPoint, scene: SKSceneAddOn) {
        let localTouch : CGPoint = convert(scene.gameWorld.hud.getLocalCoordinate(touchLocation: touchLocation, scene: scene), to: self)
        if self.calculateAccumulatedFrame().contains(localTouch) {
            scene.gameWorld.config.gameStateManager(value: "pause", scene: scene)
        }
    }
}
