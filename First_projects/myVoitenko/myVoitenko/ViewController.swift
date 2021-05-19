//
//  ViewController.swift
//  myVoitenko
//
//  Created by kymblc on 16.02.2020.
//  Copyright © 2020 traceback. All rights reserved.
//

import UIKit
import AVFoundation

// need settings file wich i dont want to show you


class ViewController: UIViewController {

    @IBOutlet weak var SubscriberText: UILabel!
    
    var igorSound = myAudioPlayer()
    var connecter = youtubeApiConnector(channelId: settingVoitenkoId)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //connecter.updateMySelf()
        connecter.deliverSubsToLabel(label: SubscriberText)
    }
    

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            igorSound.randomPhrase()
        }
    }


}

