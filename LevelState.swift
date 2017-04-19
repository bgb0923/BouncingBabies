//
//  LevelState.swift
//  StructureFire
//
//  Created by William Brancato on 12/5/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import SpriteKit

class LevelState : SKNode {
    
    var Id = 1
    var player = Player()
    var babies = Baby()
    var walls = SurroundingWalls()
    var config = Configuration()
    var building = Building()
    var hud : HUD!
    var clouds = CloudScene()
    var powerUpGenerator = PowerUpGenerator()
    var dropSwitchLabel1 = SKLabelNode(text: "Move")
    var dropSwitchLabel2 = SKLabelNode(text: "Here")
    var stars = Star()
    
    override init() {
        super.init()
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func setup() {
        
        // add the drop switch label
        self.dropSwitchLabel1.fontSize = 40
        self.dropSwitchLabel1.fontColor = UIColor.white
        self.dropSwitchLabel1.fontName = "Chalkduster"
        self.dropSwitchLabel1.position.x = -UIScreen.main.bounds.width / 8
        self.dropSwitchLabel1.position.y = -UIScreen.main.bounds.height / 4
        self.addChild(dropSwitchLabel1)
        
        self.dropSwitchLabel2.fontSize = 40
        self.dropSwitchLabel2.fontColor = UIColor.white
        self.dropSwitchLabel2.fontName = "Chalkduster"
        self.dropSwitchLabel2.position.x = self.dropSwitchLabel1.position.x
        self.dropSwitchLabel2.position.y += self.dropSwitchLabel1.position.y - self.dropSwitchLabel1.frame.height
        self.addChild(dropSwitchLabel2)
        
        // add the power ups
        self.addChild(powerUpGenerator)
        
        // add the configuration settings
        self.addChild(config)
        
        // add the building
        building.zPosition = 2
        self.addChild(building)
        
        // add the player
        player.zPosition = 4
        self.addChild(player)
        
        // add babies
        babies.zPosition = 3
        self.addChild(babies)
        
        // add the boundaries
        self.addChild(walls)
        
        // add the heads up display
        self.hud = HUD(config: self.config)
        hud.zPosition = 1
        self.addChild(hud)
        
        // add the sky
        self.stars.spawn()
        self.addChild(stars)
        
    }
    
    func reset() {
        // if restart is hit in the middle of the rain power power up then the remainder of the powerups will fall at the start of the next game, probably same with Drop Another
        self.powerUpGenerator.reset()
        self.config.reset()
        self.player.reset()
        self.babies.reset()
        self.stars.reset()
        self.hud.reset(config: self.config)
        self.dropSwitchLabel1.isHidden = false
        self.dropSwitchLabel2.isHidden = false
    }
}
