import Foundation
import UIKit

class soundDirector {
    var names: [String] = []
    init () {
        let fm = FileManager.default
        let res = Bundle.main.resourcePath!
        let enumerator = fm.enumerator(atPath: res)
        while let element = enumerator!.nextObject() as? String {
            if element.hasSuffix("mp3"){
                names.append(element)
            }
        }
    }
    
    func getSoundsMassive() -> [String] {
        return self.names
    }
    
    func getSize() -> Int {
        return self.names.count
    }
}
