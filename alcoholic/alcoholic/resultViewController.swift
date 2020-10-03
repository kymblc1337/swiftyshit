//
//  resultViewController.swift
//  alcoholic
//
//  Created by kymblc on 26.08.2020.
//  Copyright © 2020 traceback. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {

    
    @IBOutlet weak var minTimeLabel: UILabel!
    @IBOutlet weak var avgTimeLabel: UILabel!
    @IBOutlet weak var maxTimeLabel: UILabel!
    
    var minTime = "Ошибка"
    var avgTime = "Ошибка"
    var maxTime = "Ошибка"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minTimeLabel.text = minTime
        avgTimeLabel.text = avgTime
        maxTimeLabel.text = maxTime
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
