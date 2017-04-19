//
//  HowToPlayState.swift
//  StructureFire
//
//  Created by William Brancato on 12/26/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class HowToPlayState : SKNode {
    
    var image = SKSpriteNode(imageNamed: "HowToPlay")
    var coverUpImage = SKSpriteNode(imageNamed: "Trampoline")
    var backLabel = SKLabelNode(text: "BACK")
    var goodPowerUpLabel = SKLabelNode(text: "GOOD POWER UPS")
    var badPowerUpLabel = SKLabelNode(text: "BAD POWER UPS")
    var neutralLabel = SKLabelNode(text: "NEUTRAL POWER UPS")
    var objectiveLabel = SKLabelNode(text: "OBJECTIVE:  MOVE FIREMEN TO BOUNCE BABIES OFF THE SCREEN")
    
    
    var powerUpAqua = SKSpriteNode(imageNamed: "PowerUp_Aqua")
    var aquaPowerUpLabel = SKLabelNode(text: "LOWER TRAMPOLINE")
    var powerUpYellow = SKSpriteNode(imageNamed: "PowerUp_Pink")
    var yellowPowerUpLabel = SKLabelNode(text: "TRAMPOLINE SMALLER")
    var powerUpGray = SKSpriteNode(imageNamed: "PowerUp_Gray")
    var grayPowerUpLabel = SKLabelNode(text: "RAIN POWER UPS")
    var powerUpGreen = SKSpriteNode(imageNamed: "PowerUp_Green")
    var greenPowerUpLabel = SKLabelNode(text: "PLUS ONE LIFE")
    var powerUpOrange = SKSpriteNode(imageNamed: "PowerUp_Orange")
    var orangePowerUpLabel = SKLabelNode(text: "RAISE TRAMPOLINE")
    var powerUpPink = SKSpriteNode(imageNamed: "PowerUp_Yellow")
    var pinkPowerUpLabel = SKLabelNode(text: "TRAMPOLINE BIGGER")
    var powerUpPurple = SKSpriteNode(imageNamed: "PowerUp_Purple")
    var purplePowerUpLabel = SKLabelNode(text: "DROP ANOTHER")
    var powerUpRed = SKSpriteNode(imageNamed: "PowerUp_Red")
    var redPowerUpLabel = SKLabelNode(text: "MINUS ONE LIFE")
    var powerUpWhite = SKSpriteNode(imageNamed: "PowerUp_White")
    var whitePowerUpLabel = SKLabelNode(text: "RANDOM")
    
    override init() {
        super.init()
        
        self.coverUpImage.zPosition = 100
        self.addChild(coverUpImage)
        
        self.addChild(image)
        image.size = CGSize(width:200, height: 200)

        //add all of the stuff - man this was annoying
        
        self.objectiveLabel.fontColor = UIColor.white
        self.objectiveLabel.fontName = "chalkduster"
        self.objectiveLabel.fontSize = 20
        self.objectiveLabel.zPosition = 101
        self.objectiveLabel.position.y = UIScreen.main.bounds.height / 2.5 - self.objectiveLabel.frame.height
        self.addChild(objectiveLabel)
        
        self.goodPowerUpLabel.fontColor = UIColor.white
        self.goodPowerUpLabel.fontName = "chalkduster"
        self.goodPowerUpLabel.fontSize = 20
        self.goodPowerUpLabel.zPosition = 101
        self.goodPowerUpLabel.position = CGPoint(x: -UIScreen.main.bounds.width / 4, y: self.objectiveLabel.position.y - self.goodPowerUpLabel.frame.height * 2)
        self.addChild(goodPowerUpLabel)
        
        self.powerUpGreen.size = CGSize(width: self.powerUpGreen.size.width * 0.04, height: self.powerUpGreen.size.height * 0.04)
        self.powerUpGreen.position = CGPoint(x: -UIScreen.main.bounds.width / 2.1, y: self.goodPowerUpLabel.position.y - self.goodPowerUpLabel.frame.height * 2)
        self.powerUpGreen.zPosition = 101
        self.addChild(powerUpGreen)
        
        self.greenPowerUpLabel.fontColor = UIColor.white
        self.greenPowerUpLabel.fontName = "chalkduster"
        self.greenPowerUpLabel.fontSize = 20
        self.greenPowerUpLabel.zPosition = 101
        self.greenPowerUpLabel.position = CGPoint(x: self.powerUpGreen.position.x + self.greenPowerUpLabel.frame.width / 2 + self.powerUpGreen.size.width / 2,
                                                  y: powerUpGreen.position.y - powerUpGreen.size.height / 10)
        self.addChild(greenPowerUpLabel)
        
        self.powerUpPink.size = CGSize(width: self.powerUpPink.size.width * 0.04, height: self.powerUpPink.size.height * 0.04)
        self.powerUpPink.position = CGPoint(x: powerUpGreen.position.x, y: self.powerUpGreen.position.y - self.goodPowerUpLabel.frame.height * 1.5)
        self.powerUpPink.zPosition = 101
        self.addChild(powerUpPink)
        
        self.pinkPowerUpLabel.fontColor = UIColor.white
        self.pinkPowerUpLabel.fontName = "chalkduster"
        self.pinkPowerUpLabel.fontSize = 20
        self.pinkPowerUpLabel.zPosition = 101
        self.pinkPowerUpLabel.position = CGPoint(x: self.powerUpPink.position.x + self.pinkPowerUpLabel.frame.width / 2 + self.powerUpPink.size.width / 2,
                                                 y: powerUpPink.position.y - powerUpPink.size.height / 10)
        self.addChild(pinkPowerUpLabel)
        
        self.powerUpAqua.size = CGSize(width: self.powerUpAqua.size.width * 0.04, height: self.powerUpAqua.size.height * 0.04)
        self.powerUpAqua.position = CGPoint(x: powerUpGreen.position.x, y: self.powerUpPink.position.y - self.goodPowerUpLabel.frame.height * 1.5)
        self.powerUpAqua.zPosition = 101
        self.addChild(powerUpAqua)
        
        self.aquaPowerUpLabel.fontColor = UIColor.white
        self.aquaPowerUpLabel.fontName = "chalkduster"
        self.aquaPowerUpLabel.fontSize = 20
        self.aquaPowerUpLabel.zPosition = 101
        self.aquaPowerUpLabel.position = CGPoint(x: self.powerUpAqua.position.x + self.aquaPowerUpLabel.frame.width / 2 + self.powerUpAqua.size.width / 2,
                                                 y: powerUpAqua.position.y - powerUpAqua.size.height / 10)
        self.addChild(aquaPowerUpLabel)
        
        self.powerUpRed.size = CGSize(width: self.powerUpRed.size.width * 0.04, height: self.powerUpRed.size.height * 0.04)
        self.powerUpRed.position = CGPoint(x: powerUpGreen.position.x + UIScreen.main.bounds.width / 2 + self.powerUpRed.size.width / 2, y: self.powerUpGreen.position.y)
        self.powerUpRed.zPosition = 101
        self.addChild(powerUpRed)

        self.redPowerUpLabel.fontColor = UIColor.white
        self.redPowerUpLabel.fontName = "chalkduster"
        self.redPowerUpLabel.fontSize = 20
        self.redPowerUpLabel.zPosition = 101
        self.redPowerUpLabel.position = CGPoint(x: self.powerUpRed.position.x + self.redPowerUpLabel.frame.width / 2 + self.powerUpRed.size.width / 2,
                                                 y: powerUpRed.position.y - powerUpRed.size.height / 10)
        self.addChild(redPowerUpLabel)
        
        self.powerUpYellow.size = CGSize(width: self.powerUpYellow.size.width * 0.04, height: self.powerUpYellow.size.height * 0.04)
        self.powerUpYellow.position = CGPoint(x: powerUpRed.position.x, y: self.powerUpPink.position.y)
        self.powerUpYellow.zPosition = 101
        self.addChild(powerUpYellow)
        
        self.yellowPowerUpLabel.fontColor = UIColor.white
        self.yellowPowerUpLabel.fontName = "chalkduster"
        self.yellowPowerUpLabel.fontSize = 20
        self.yellowPowerUpLabel.zPosition = 101
        self.yellowPowerUpLabel.position = CGPoint(x: self.powerUpYellow.position.x + self.yellowPowerUpLabel.frame.width / 2 + self.powerUpYellow.size.width / 2,
                                                y: powerUpYellow.position.y - powerUpYellow.size.height / 10)
        self.addChild(yellowPowerUpLabel)
        
        self.powerUpOrange.size = CGSize(width: self.powerUpOrange.size.width * 0.04, height: self.powerUpOrange.size.height * 0.04)
        self.powerUpOrange.position = CGPoint(x: powerUpRed.position.x, y: self.powerUpAqua.position.y)
        self.powerUpOrange.zPosition = 101
        self.addChild(powerUpOrange)
        
        self.orangePowerUpLabel.fontColor = UIColor.white
        self.orangePowerUpLabel.fontName = "chalkduster"
        self.orangePowerUpLabel.fontSize = 20
        self.orangePowerUpLabel.zPosition = 101
        self.orangePowerUpLabel.position = CGPoint(x: self.powerUpOrange.position.x + self.orangePowerUpLabel.frame.width / 2 + self.powerUpOrange.size.width / 2,
                                                y: powerUpOrange.position.y - powerUpOrange.size.height / 10)
        self.addChild(orangePowerUpLabel)
        
        self.badPowerUpLabel.fontColor = UIColor.white
        self.badPowerUpLabel.fontName = "chalkduster"
        self.badPowerUpLabel.fontSize = 20
        self.badPowerUpLabel.zPosition = 101
        self.badPowerUpLabel.position = CGPoint(x: UIScreen.main.bounds.width / 4, y: self.objectiveLabel.position.y - self.badPowerUpLabel.frame.height * 2)
        self.addChild(badPowerUpLabel)
        
        self.neutralLabel.fontColor = UIColor.white
        self.neutralLabel.fontName = "chalkduster"
        self.neutralLabel.fontSize = 20
        self.neutralLabel.position.y = self.orangePowerUpLabel.position.y - self.neutralLabel.frame.height * 2
        self.neutralLabel.zPosition = 101
        self.addChild(neutralLabel)
        
        self.powerUpPurple.size = CGSize(width: self.powerUpPurple.size.width * 0.04, height: self.powerUpPurple.size.height * 0.04)
        self.powerUpPurple.position = CGPoint(x: self.powerUpGreen.position.x - self.powerUpGreen.size.width / 10, y: self.neutralLabel.position.y - self.neutralLabel.frame.height * 2)
        self.powerUpPurple.zPosition = 101
        self.addChild(powerUpPurple)
        
        self.purplePowerUpLabel.fontColor = UIColor.white
        self.purplePowerUpLabel.fontName = "chalkduster"
        self.purplePowerUpLabel.fontSize = 20
        self.purplePowerUpLabel.zPosition = 101
        self.purplePowerUpLabel.position = CGPoint(x: self.powerUpPurple.position.x + self.purplePowerUpLabel.frame.width / 2 + self.powerUpPurple.size.width / 2,
                                                   y: powerUpPurple.position.y - powerUpPurple.size.height / 10)
        self.addChild(purplePowerUpLabel)

        self.powerUpWhite.size = CGSize(width: self.powerUpWhite.size.width * 0.04, height: self.powerUpWhite.size.height * 0.04)
        self.powerUpWhite.position = CGPoint(x: self.purplePowerUpLabel.position.x + self.purplePowerUpLabel.frame.size.width / 2 + self.powerUpPurple.size.width / 2,
                                             y: self.neutralLabel.position.y - self.neutralLabel.frame.height * 2)
        self.powerUpWhite.zPosition = 101
        self.addChild(powerUpWhite)
        
        self.whitePowerUpLabel.fontColor = UIColor.white
        self.whitePowerUpLabel.fontName = "chalkduster"
        self.whitePowerUpLabel.fontSize = 20
        self.whitePowerUpLabel.zPosition = 101
        self.whitePowerUpLabel.position = CGPoint(x: self.powerUpWhite.position.x + self.whitePowerUpLabel.frame.width / 2 + self.powerUpWhite.size.width / 2,
                                                   y: powerUpWhite.position.y - powerUpWhite.size.height / 10)
        self.addChild(whitePowerUpLabel)

        self.powerUpGray.size = CGSize(width: self.powerUpGray.size.width * 0.04, height: self.powerUpGray.size.height * 0.04)
        self.powerUpGray.position = CGPoint(x: self.whitePowerUpLabel.position.x + self.whitePowerUpLabel.frame.size.width / 2 + self.powerUpWhite.size.width / 2,
                                             y: self.neutralLabel.position.y - self.neutralLabel.frame.height * 2)
        self.powerUpGray.zPosition = 101
        self.addChild(powerUpGray)
        
        self.grayPowerUpLabel.fontColor = UIColor.white
        self.grayPowerUpLabel.fontName = "chalkduster"
        self.grayPowerUpLabel.fontSize = 20
        self.grayPowerUpLabel.zPosition = 101
        self.grayPowerUpLabel.position = CGPoint(x: self.powerUpGray.position.x + self.grayPowerUpLabel.frame.width / 2 + self.powerUpGray.size.width / 2,
                                                  y: powerUpGray.position.y - powerUpGray.size.height / 10)
        self.addChild(grayPowerUpLabel)
        
        self.backLabel.fontColor = UIColor.white
        self.backLabel.fontName = "chalkduster"
        self.backLabel.fontSize = 20
        self.backLabel.position.y = CGFloat(-UIScreen.main.bounds.height / 2 + self.backLabel.frame.height)
        self.backLabel.zPosition = 101
        self.addChild(backLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func back(touchLocation: CGPoint, scene: SKSceneAddOn) {
        if self.backLabel.calculateAccumulatedFrame().contains(touchLocation) {
            scene.howToScreen.isHidden = true
            scene.gameWorld.config.howToStateActive = false
        }
    }
    
}
