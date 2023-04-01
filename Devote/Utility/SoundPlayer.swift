//
//  SoundPlayer.swift
//  Devote
//
//  Created by Ashish Yadav on 01/04/23.
//

import Foundation
import AVKit

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Cound not find and play the sound file.")
        }
    }
}
