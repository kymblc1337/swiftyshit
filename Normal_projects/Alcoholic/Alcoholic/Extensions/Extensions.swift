import Foundation
import UIKit

extension UIColor {
    public convenience init (r:Int, g: Int, b: Int, alpha: CGFloat = 1) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha)
    }
    
    struct AlcoholicColors {
        
        //MARK: Basic Colors
        public static var blueColor: UIColor {
            return UIColor(r: 128, g: 161, b: 212)
        }
        
        public static var darkColor: UIColor {
            return UIColor(r: 44, g: 41, b: 72)
        }
        
        public static var cardButtonColor: UIColor {
            return UIColor(r: 221, g: 221, b: 223)
        }
        
        public static var redColor: UIColor {
            return UIColor(r: 212, g: 72, b: 62)
        }
        
        public static var yellowColor: UIColor {
            return UIColor(r: 247, g: 210, b: 92)
        }
        
        public static var greenColor: UIColor {
            return UIColor(r: 93, g: 157, b: 82)
        }
        
        //MARK: For Themes
        public static var backgroundColor: UIColor {
            return UIColor(r: 249, g: 249, b: 249)
        }
        
        public static var cardColor: UIColor {
            return UIColor(r: 247, g: 247, b: 247)
        }
        
        public static var textColor: UIColor {
            return UIColor.AlcoholicColors.darkColor
        }
        
        public static var shadowColor: UIColor {
            return UIColor.black
        }
        
        public static var buttonMainColor: UIColor {
            return UIColor(r: 223, g: 223, b: 225)
        }
        
        public static var buttonStrokeColor: UIColor {
            return UIColor(r: 182, g: 182, b: 184)
        }
    }
}

extension UIFont {
    struct AlcoholicFonts {
        public static var bold35: UIFont {
            return UIFont.boldSystemFont(ofSize: 35)
        }
        
        public static var bold25: UIFont {
            return UIFont.boldSystemFont(ofSize: 25)
        }
        
        public static var bold14: UIFont {
            return UIFont.boldSystemFont(ofSize: 14)
        }
        
        public static var bold16: UIFont {
            return UIFont.boldSystemFont(ofSize: 16)
        }
        
        public static var bold18: UIFont {
            return UIFont.boldSystemFont(ofSize: 18)
        }
    }
}

extension UITextField {
    func makeCuteCornerRadius() {
        self.layer.cornerRadius = self.bounds.height * 0.27
    }
    
    public static func createAlcoholicTextField() -> UITextField {
        let textFeild = UITextField()
        textFeild.layer.borderWidth = 2
        textFeild.font = UIFont.AlcoholicFonts.bold18
        textFeild.textAlignment = .center
        textFeild.layer.borderColor = UIColor.AlcoholicColors.buttonStrokeColor.cgColor
        textFeild.isUserInteractionEnabled = false
        return textFeild
    }
}

protocol ClassName {
    static func className() -> String
}

extension ClassName {
    static func className() -> String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ClassName {}
extension UICollectionViewCell {
    public static var reuseIdentifier: String {
            return className()
    }
}

extension UILabel {
    static var AlcoholicTimePredicton: UILabel {
        let label = UILabel()
        label.font = UIFont.AlcoholicFonts.bold25
        label.textColor = UIColor.AlcoholicColors.textColor
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }
    
    static var AlcoholicTimeExplaining: UILabel {
        let label = UILabel()
        label.font = UIFont.AlcoholicFonts.bold14
        label.textColor = UIColor.AlcoholicColors.textColor
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }
}

extension UIView {
    func makeLighterCircle() {
        self.layer.borderWidth = 2
        //self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.shadowColor = UIColor.AlcoholicColors.shadowColor.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = .init(width: 0, height: 2)
        self.layer.cornerRadius = self.bounds.width / 2
    }
    
    func dropShadow() {
        self.layer.shadowColor = UIColor.AlcoholicColors.shadowColor.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset = .init(width: -1, height: 2)
    }
    
    public static func createCircleView(backgroundColor: UIColor, strokeColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.layer.borderWidth = 10
        view.layer.borderColor = strokeColor.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.bounds.width / 2
        return view
    }
}

extension UIButton {
    func makeCuteCornerRadius() {
        self.layer.cornerRadius = self.bounds.height * 0.27
    }
    
    static public var AlcoholicBigButton: UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.AlcoholicColors.buttonMainColor
        button.titleLabel?.font = UIFont.AlcoholicFonts.bold18
        button.layer.borderColor = UIColor.AlcoholicColors.buttonStrokeColor.cgColor
        button.layer.borderWidth = 2
        button.setTitleColor(UIColor.AlcoholicColors.textColor, for: .normal)
        return button
    }
}
