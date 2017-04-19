//
//  Sound.swift
//  StructureFire
//
//  Created by William Brancato on 12/25/16.
//  Copyright © 2016 William Brancato. All rights reserved.
//

import AVFoundation

class Sound {
    var audioPlayer = AVAudioPlayer()
    
    init (_ fileName: String) {
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!)
    }
    
    //properties
    var looping: Bool {
        get {
            return audioPlayer.numberOfLoops < 0
        }
        set {
            if newValue {
                audioPlayer.numberOfLoops = -1
            } else {
                audioPlayer.numberOfLoops =  0
            }
            
        }
    }
    
    var volume: Float {
        get {
            return audioPlayer.volume
        }
        set {
            audioPlayer.volume = newValue
        }
    }
    
    //methods
    func play() {
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
}
 
