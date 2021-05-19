import Foundation

class CalculationService {
    private let models: [DrinkModel]
    private let k: Float = 0.8 // Should took from user
    private let m: Float = 62 //  Should took from user
    private let r: Float = 0.7 // Should took from user
    init (with models: [DrinkModel]) {
        self.models = models
    }
    
    private lazy var pureAlcoholVolume = models.reduce(0, {$0 + $1.size * $1.degree})
    
    public var result: Void {
        let bac = ((Float(pureAlcoholVolume) * 0.9 * k) / (m * r)) / 116
        print("bac is \(bac)")
        print("bac is \(bac / 0.20)")
        print("bac is \(bac / 0.15)")
        print("bac is \(bac / 0.10)")
    }
}
