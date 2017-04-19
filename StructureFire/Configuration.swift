//
//  Constants.swift
//  StructureFire
//
//  Created by William Brancato on 12/5/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

let BabyCategory : UInt32 = 0x1 << 1
let TrampolineCategory : UInt32 = 0x1 << 2
let FloorCategory : UInt32 = 0x1 << 3
let FiremanCategory : UInt32 = 0x1 << 4
let BuildingCategory : UInt32 = 0x1 << 5
let PowerUpCategory : UInt32 = 0x1 << 6

class Configuration : SKNode {
    var score = 100
    var finalScore = 0
    var nrLives = 10
    var levelStateActive : Bool!
    var pauseStateActive : Bool!
    var gameOverStateActive : Bool!
    var startUpStateActive : Bool!
    var howToStateActive : Bool!
    var dropSwitch = false
    var powerUpSwitch = false
    
    func gameStateManager(value: String, scene: SKSceneAddOn) {
        switch value {
        case "pause" :
            self.levelStateActive = false
            self.pauseStateActive = true
            self.gameOverStateActive = false
            self.startUpStateActive = false
            self.howToStateActive = false
            scene.isPaused = true
            scene.gameWorld.removeFromParent()
            scene.addChild(scene.pauseScreen)
        case "resume" :
            self.levelStateActive = true
            self.pauseStateActive = false
            self.gameOverStateActive = false
            self.startUpStateActive = false
            self.howToStateActive = false
            scene.isPaused = false
            scene.addChild(scene.gameWorld)
            scene.pauseScreen.removeFromParent()
        case "startGame" :
            self.levelStateActive = true
            self.pauseStateActive = false
            self.gameOverStateActive = false
            self.startUpStateActive = false
            self.howToStateActive = false
            scene.titleScreen.removeFromParent()
            scene.gameWorld.reset()
            scene.addChild(scene.gameWorld)
        case "title", "backToTitle" :
            self.levelStateActive = false
            self.pauseStateActive = false
            self.gameOverStateActive = false
            self.startUpStateActive = true
            self.howToStateActive = false
            if value == "backToTitle" {
                scene.gameOverScreen.removeFromParent()
                scene.titleScreen.reset()
            }
            scene.addChild(scene.titleScreen)
        case "restart", "newGame" :
            self.levelStateActive = true
            self.pauseStateActive = false
            self.gameOverStateActive = false
            self.startUpStateActive = false
            self.howToStateActive = false
            if value == "restart" {
                scene.pauseScreen.removeFromParent()
                scene.isPaused = false
            } else if value == "newGame" {
                scene.gameOverScreen.removeFromParent()
            }
            scene.gameWorld.reset()
            scene.addChild(scene.gameWorld)
        case "gameOver" :
            self.levelStateActive = false
            self.pauseStateActive = false
            self.gameOverStateActive = true
            self.startUpStateActive = false
            self.howToStateActive = false
            scene.gameWorld.removeFromParent()
            scene.addChild(scene.gameOverScreen)
        case "howTo":
            self.howToStateActive = true
            scene.howToScreen.isHidden = false
            print("switch to how to")
        default :
            print("Something went wrong")
        }
    }
    
    func reset() {
        self.score = 100
        self.finalScore = 0
        self.nrLives = 10
        self.dropSwitch = false
        self.powerUpSwitch = false
    }
    
}
