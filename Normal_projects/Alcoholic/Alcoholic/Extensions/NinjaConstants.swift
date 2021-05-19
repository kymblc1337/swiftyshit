import UIKit

struct NinjaConstants {
    static var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    static var circleSize: CGFloat {
        screenBounds.width * 0.2
    }
    
    static var cellSize: CGSize {
        let width = screenBounds.width * 0.36
        let height = screenBounds.height * 0.21
        return CGSize(width: width, height: height)
    }
    
    static var degree: String = "°"
    
    static var explainingText: String = """
Все дело в том, что невозможно точно предсказать, через сколько алкоголь точно выведется именно из вашего организма. Мы строим наши прогнозы, исходя из вашего веса, роста, веса и пола. Так же есть такой показатель как скорость выведения алкоголя из организма, который зависит от множества факторов: наследственности, предрасположенности к быстрому выведению алкоголя и тд.
    
    Мы выдаем три прогноза - при быстрой, средней и долгой выветриваемости алкоголя. Мы настоятельно рекомендуем вам не садится за руль, до истечения времени, указанного рядом с зеленым сигналом светофора.
"""
}
