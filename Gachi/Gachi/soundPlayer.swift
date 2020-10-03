import Foundation
import AVFoundation



class myAudioPlayer
{
    var audio: AVAudioPlayer?

    
    
    func randomPhrase()
    {
        let mas = soundDirector().getSoundsMassive()
        print(mas)
        let phrase = mas.randomElement()!
        print(phrase)
        exactPhrase(phraseFileName: phrase)
    }
    
    func exactPhrase(phraseFileName : String)
    {
        let path = Bundle.main.path(forResource: phraseFileName, ofType:nil)!
        print(path)
        let localUrl = URL(fileURLWithPath: path)
        do {
            self.audio = try AVAudioPlayer(contentsOf: localUrl)
            self.audio?.play()
        } catch {
            print("Nofile")
        }
         
    }
}
