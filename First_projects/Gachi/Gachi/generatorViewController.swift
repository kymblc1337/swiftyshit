import UIKit
import AVFoundation



class generatorViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    var gachiSound = myAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

    @IBAction func randomSound(_ sender: Any) {
        gachiSound.randomPhrase()
    }
}
