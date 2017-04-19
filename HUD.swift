//
//  HUD.swift
//  StructureFire
//
//  Created by William Brancato on 12/10/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class HUD: SKNode {
    
    var lifeBar = LifeBar()
    var scoreBar = ScoreBar()
    var pauseButton = PauseButton()
    
    init(config: Configuration) {
        super.init()
        
        // position the HUD
        self.position = CGPoint(x:UIScreen.main.bounds.width / 2 - lifeBar.life.size.width / 2, y: UIScreen.main.bounds.height / 2 - lifeBar.life.size.height)
        
        // add the scorebar
        scoreBar.display.fontColor = UIColor.white
        scoreBar.position = CGPoint(x: scoreBar.position.x - lifeBar.life.size.width * 1.5, y: scoreBar.position.y + lifeBar.life.size.height / 2)
        self.addChild(scoreBar)
        
        // add the life bar
        self.lifeBar.drawLives(config: config)
        self.addChild(lifeBar)
        
        // add the pause button
        pauseButton.position.y += self.lifeBar.life.size.height / 1.3
        self.addChild(pauseButton)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getLocalCoordinate(touchLocation: CGPoint, scene: SKSceneAddOn) -> CGPoint {
        let localHudTouch : CGPoint = convert(touchLocation, from: scene)
        return localHudTouch
    }
    
    func reset(config: Configuration) {
        self.lifeBar.reset()
        self.lifeBar.drawLives(config: config)
    }
}
