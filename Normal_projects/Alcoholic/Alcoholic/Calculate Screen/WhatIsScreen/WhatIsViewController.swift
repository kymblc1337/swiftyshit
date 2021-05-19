import UIKit
import PinLayout

class WhatIsViewController: UIViewController {
    private weak var whatIsLabel: UILabel!
    private weak var explainLabel: UILabel!
    
    private weak var redCircleView: UIView!
    private weak var yellowCircleView: UIView!
    private weak var greenCircleView: UIView!
    
    private weak var redTimeLabel: UILabel!
    private weak var yellowTimeLabel: UILabel!
    private weak var greenTimeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        layoutUI()
    }

}

extension WhatIsViewController {
    private func setupUI() {
        setupBackground()
        setupWhatIsLabel()
        setupExplainLabel()
        setupRedColorView()
        setupYellowColorView()
        setupGreenColorView()
        setupRedTimeLabel()
        setupYellowTimeLabel()
        setupGreenTimeLabel()
    }
    
    private func layoutUI() {
        layoutWhatIsLabel()
        layoutExplainLabel()
        layoutRedColorView()
        layoutYellowColorView()
        layoutGreenColorView()
        layoutRedTimeLabel()
        layoutYellowTimeLabel()
        layoutGreenTimeLabel()
    }
    
    //MARK: Background
    private func setupBackground() {
        self.view.backgroundColor = UIColor.AlcoholicColors.backgroundColor
    }
    
    //MARK: WhatIs Label
    
    private func setupWhatIsLabel() {
        let label = UILabel()
        whatIsLabel = label
        whatIsLabel.font = UIFont.AlcoholicFonts.bold35
        whatIsLabel.textColor = UIColor.AlcoholicColors.textColor
        whatIsLabel.textAlignment = .center
        whatIsLabel.text = "Что это за цифры?"
        whatIsLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(whatIsLabel)
    }
    
    private func layoutWhatIsLabel() {
        whatIsLabel.pin
            .left(20)
            .right(20)
            .top().marginTop(5%)
            .sizeToFit(.width)
    }
    
    //MARK: ExplainLabel
    
    private func setupExplainLabel() {
        let label = UILabel()
        explainLabel = label
        explainLabel.font = UIFont.AlcoholicFonts.bold16
        explainLabel.textColor = UIColor.AlcoholicColors.textColor
        explainLabel.textAlignment = .center
        explainLabel.numberOfLines = 0
        explainLabel.textAlignment = .left
        explainLabel.text = NinjaConstants.explainingText
        explainLabel.adjustsFontSizeToFitWidth = true
        view.addSubview(explainLabel)
    }
    
    private func layoutExplainLabel() {
        explainLabel.pin
            .height(45%)
            .left(10)
            .right(10)
            .below(of: whatIsLabel, aligned: .center)
            .marginTop(5%)
    }
    
    
    //MARK: redColorView
    
    private func setupRedColorView() {
        let someview = UIView()
        redCircleView = someview
        redCircleView.backgroundColor = UIColor.AlcoholicColors.redColor
        redCircleView.layer.borderColor = UIColor.AlcoholicColors.darkColor.cgColor
        view.addSubview(redCircleView)
    }
    
    private func layoutRedColorView() {
        let size = NinjaConstants.circleSize * 0.7
        redCircleView.pin
            .center(to: explainLabel.anchor.bottomLeft)
            .marginBottom(3%)
            .marginLeft(8%)
            .marginTop(9%)
            .width(size)
            .height(size)
        redCircleView.makeLighterCircle()
    }
    
    //MARK: yellowColorView
    
    private func setupYellowColorView() {
        let someview = UIView()
        yellowCircleView = someview
        yellowCircleView.backgroundColor = UIColor.AlcoholicColors.yellowColor
        yellowCircleView.layer.borderColor = UIColor.AlcoholicColors.darkColor.cgColor
        view.addSubview(yellowCircleView)
    }
    
    private func layoutYellowColorView() {
        let size = NinjaConstants.circleSize * 0.7
        yellowCircleView.pin
            .center(to: redCircleView.anchor.bottomCenter)
            .marginBottom(3%)
            .marginTop(9%)
            .width(size)
            .height(size)
        yellowCircleView.makeLighterCircle()
    }
    
    //MARK: greenColorView
    
    private func setupGreenColorView() {
        let someview = UIView()
        greenCircleView = someview
        greenCircleView.backgroundColor = UIColor.AlcoholicColors.greenColor
        greenCircleView.layer.borderColor = UIColor.AlcoholicColors.darkColor.cgColor
        view.addSubview(greenCircleView)
    }
    
    private func layoutGreenColorView() {
        let size = NinjaConstants.circleSize * 0.7
        greenCircleView.pin
            .center(to: yellowCircleView.anchor.bottomCenter)
            .marginBottom(3%)
            .marginTop(9%)
            .width(size)
            .height(size)
        greenCircleView.makeLighterCircle()
    }
    
    //MARK: redTimeLabel
    
    private func setupRedTimeLabel() {
        let label = UILabel.AlcoholicTimeExplaining
        redTimeLabel = label
        redTimeLabel.text = "0.20 ‰/час (в случае быстрой выветриваемости алкоголя)"
        view.addSubview(redTimeLabel)
    }
    
    private func layoutRedTimeLabel() {
        redTimeLabel.pin
            .after(of: redCircleView, aligned: .center)
            .marginLeft(7%)
            .height(of: redCircleView)
            .right(10)
    }
    
    //MARK: yellowTimeLabel
    
    private func setupYellowTimeLabel() {
        let label = UILabel.AlcoholicTimeExplaining
        yellowTimeLabel = label
        yellowTimeLabel.text = "0.15 ‰/час (в случае средней выветриваемости алкоголя)"
        view.addSubview(yellowTimeLabel)
    }
    
    private func layoutYellowTimeLabel() {
        yellowTimeLabel.pin
            .after(of: yellowCircleView, aligned: .center)
            .marginLeft(7%)
            .height(of: yellowCircleView)
            .right(10)
    }
    
    //MARK: greenTimeLabel
    
    private func setupGreenTimeLabel() {
        let label = UILabel.AlcoholicTimeExplaining
        greenTimeLabel = label
        greenTimeLabel.text = "0.10 ‰/час (в случае долгой выветриваемости алкоголя)"
        view.addSubview(greenTimeLabel)
    }
    
    private func layoutGreenTimeLabel() {
        greenTimeLabel.pin
            .after(of: greenCircleView, aligned: .center)
            .marginLeft(7%)
            .height(of: greenCircleView)
            .right(10)
    }
}
