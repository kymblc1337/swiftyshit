//
//  ViewController.swift
//  Gachi
//
//  Created by kymblc on 18.08.2020.
//  Copyright © 2020 traceback. All rights reserved.
//

import UIKit
import AVFoundation


class myTableViewController: UITableViewController {
    
    var gachiSound = myAudioPlayer()
    var names: [String] = soundDirector().getSoundsMassive()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "gachiCell")
        names = soundDirector().getSoundsMassive()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soundDirector().getSize()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gachiCell", for: indexPath)
        let name = String(self.names[indexPath.row].replacingOccurrences(of: ".mp3", with: ""))
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gachiSound.exactPhrase(phraseFileName: self.names[indexPath.row])
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}

