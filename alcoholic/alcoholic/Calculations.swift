import Foundation

class AlcoholCalculator {
    var weight: Int = 65
    var pureAlcohol: Float = 0
    var waterWeight: Float = 0
    var sex: String = "male"
    var BAC: Float = 0
    var heightK: Float = 1
    
    init() {
        
    }
    
    init(weight : Int, sex: String, height: Int) {
        self.weight = weight
        self.sex = sex
        if (height > 120 && height < 140) {
            self.heightK = 1.0
        } else if (height > 140 && height < 160) {
            self.heightK = 0.95
        } else if (height > 160 && height < 180) {
            self.heightK = 0.85
        } else {
            self.heightK = 0.75
        }
        self.waterCalculation()
    }
    
    func timeCalculation(rezorb : Float) -> String {
        let time = self.BAC / rezorb
        let hrs = Int(time)
        let mints = Int((time - Float(hrs)) * 60)
        return hrs > 0 ? "\(hrs) час, \(mints) мин" : "\(mints) мин"
    }
    
    func waterCalculation() {
        let sexIndex = self.sex == "male" ? Float(0.7) : Float(0.6)
        self.waterWeight = Float(self.weight) * sexIndex
    }
    
    func addDrink (drinkSize : Int, drinkAlcohol: Float) {
        let digestibilityСoefficient: Float = 0.85
        self.pureAlcohol += Float(drinkSize) * drinkAlcohol * digestibilityСoefficient
        self.windmarkFormula()
    }
    
    func addDrink(drinkSize: String?, drinkAlcohol: String?) {
        guard let size = Int(drinkSize!) else { return }
        guard let alco = Float(drinkAlcohol!) else { return }
        if size <= 0 || alco <= 0 { return }
        addDrink(drinkSize: size, drinkAlcohol: (alco / 100))
    }
    
    func windmarkFormula() {
        self.BAC = self.pureAlcohol * self.heightK / self.waterWeight
    }
    
}
