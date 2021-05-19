//
//  soundboard.swift
//  myVoitenko
//
//  Created by kymblc on 26.04.2020.
//  Copyright © 2020 traceback. All rights reserved.
//

import Foundation
import AVFoundation



class myAudioPlayer
{
    var audioFileName: [String]
    var audio: AVAudioPlayer?

    init (masOfFiles : [String])
    {
        self.audioFileName = masOfFiles
    }
    
    init()
    {
        self.audioFileName = ["Napoleon", "Бомбить 24 на 7", "Жирные усатые потные мужики", "Я буду бомбить это", "Шатай"]
        // shit
    }
    
    
    func randomPhrase()
    {
        let phrase = self.audioFileName.randomElement()! + ".mp3"
        exactPhrase(phraseFileName: phrase)
    }
    
    func exactPhrase(phraseFileName : String)
    {
        let path = Bundle.main.path(forResource: phraseFileName, ofType:nil)!
        let localUrl = URL(fileURLWithPath: path)
        do {
            self.audio = try AVAudioPlayer(contentsOf: localUrl)
            self.audio?.play()
        } catch {
            print("Nofile")
        }
    }
}
