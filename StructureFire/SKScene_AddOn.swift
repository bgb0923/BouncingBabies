//
//  SKScene_AddOn.swift
//  StructureFire
//
//  Created by William Brancato on 12/22/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import Foundation
import SpriteKit

class SKSceneAddOn : SKScene {
    
    var gameWorld = LevelState()
    var pauseScreen = PauseState()
    var titleScreen = TitleState()
    var gameOverScreen = GameOverState()
    var howToScreen = HowToPlayState()
}
