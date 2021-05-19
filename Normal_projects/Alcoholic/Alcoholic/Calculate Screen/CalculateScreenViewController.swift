import UIKit
import PinLayout

final class CalculateScreenViewController: UIViewController {
	var output: CalculateScreenViewOutput?
    
    private weak var canDriveAfterLabel: UILabel!
    private weak var whatIsButton: UIButton!
    private weak var backButton: UIButton!
    
    private weak var redCircleView: UIView!
    private weak var yellowCircleView: UIView!
    private weak var greenCircleView: UIView!
    
    private weak var redTimeLabel: UILabel!
    private weak var yellowTimeLabel: UILabel!
    private weak var greenTimeLabel: UILabel!
    
    

	override func viewDidLoad() {
		super.viewDidLoad()
        setupUI()
        output?.didLoadView()
	}
    
    override func viewDidLayoutSubviews() {
        layoutUI()
    }
    
    @objc private func didTapOnWhatIsButton() {
        output?.didTapOnWhatIsButton()
    }
    
    @objc private func didTapOnBackButton() {
        output?.didTapOnBackButton()
    }
}

extension CalculateScreenViewController {
    private func setupUI() {
        setupBackground()
        setupCanDriveAfterLabel()
        setupWhatIsButton()
        setupRedColorView()
        setupYellowColorView()
        setupGreenColorView()
        setupRedTimeLabel()
        setupYellowTimeLabel()
        setupGreenTimeLabel()
        setupBackButton()
    }
    
    private func layoutUI() {
        layoutCanDriveAfterLabel()
        layoutWhatIsButton()
        layoutRedColorView()
        layoutYellowColorView()
        layoutGreenColorView()
        layoutRedTimeLabel()
        layoutYellowTimeLabel()
        layoutGreenTimeLabel()
        layoutBackButton()
    }
    
    //MARK: Background
    private func setupBackground() {
        self.view.backgroundColor = UIColor.AlcoholicColors.backgroundColor
    }
    
    //MARK: CanDriveAfter Label
    
    private func setupCanDriveAfterLabel() {
        let label = UILabel()
        canDriveAfterLabel = label
        canDriveAfterLabel.font = UIFont.AlcoholicFonts.bold35
        canDriveAfterLabel.textColor = UIColor.AlcoholicColors.textColor
        canDriveAfterLabel.textAlignment = .center
        canDriveAfterLabel.text = "За руль через:"
        view.addSubview(canDriveAfterLabel)
    }
    
    private func layoutCanDriveAfterLabel() {
        canDriveAfterLabel.pin
            .left(20)
            .right(20)
            .top().marginTop(16%)
            .sizeToFit(.width)
    }
    
    //MARK: WhatIsButton
    
    private func setupWhatIsButton() {
        let button = UIButton(type: .system)
        whatIsButton = button
        whatIsButton.setTitle("Что это?", for: .normal)
        whatIsButton.titleLabel?.font = UIFont.AlcoholicFonts.bold16
        whatIsButton.setTitleColor(UIColor.AlcoholicColors.textColor, for: .normal)
        whatIsButton.backgroundColor = UIColor.AlcoholicColors.buttonMainColor
        whatIsButton.layer.borderWidth = 2
        whatIsButton.layer.borderColor = UIColor.AlcoholicColors.buttonStrokeColor.cgColor
        whatIsButton.addTarget(self, action: #selector(didTapOnWhatIsButton), for: .touchUpInside)
        view.addSubview(whatIsButton)
    }
    
    private func layoutWhatIsButton() {
        whatIsButton.pin
            .above(of: canDriveAfterLabel)
            .right(20)
            .width(25%).minWidth(86)
            .height(5%).minHeight(32)
        whatIsButton.makeCuteCornerRadius()
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
        let size = NinjaConstants.circleSize
        redCircleView.pin
            .center(to: canDriveAfterLabel.anchor.bottomLeft)
            .marginBottom(3%)
            .marginLeft(8%)
            .marginTop(20%)
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
        let size = NinjaConstants.circleSize
        yellowCircleView.pin
            .center(to: redCircleView.anchor.bottomCenter)
            .marginBottom(3%)
            .marginTop(15%)
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
        let size = NinjaConstants.circleSize
        greenCircleView.pin
            .center(to: yellowCircleView.anchor.bottomCenter)
            .marginBottom(3%)
            .marginTop(15%)
            .width(size)
            .height(size)
        greenCircleView.makeLighterCircle()
    }
    
    //MARK: redTimeLabel
    
    private func setupRedTimeLabel() {
        let label = UILabel.AlcoholicTimePredicton
        redTimeLabel = label
        view.addSubview(redTimeLabel)
    }
    
    private func layoutRedTimeLabel() {
        redTimeLabel.pin
            .after(of: redCircleView, aligned: .center)
            .marginLeft(10%)
            .height(of: redCircleView)
            .right(20)
    }
    
    //MARK: yellowTimeLabel
    
    private func setupYellowTimeLabel() {
        let label = UILabel.AlcoholicTimePredicton
        yellowTimeLabel = label
        view.addSubview(yellowTimeLabel)
    }
    
    private func layoutYellowTimeLabel() {
        yellowTimeLabel.pin
            .after(of: yellowCircleView, aligned: .center)
            .marginLeft(10%)
            .height(of: yellowCircleView)
            .right(20)
    }
    
    //MARK: greenTimeLabel
    
    private func setupGreenTimeLabel() {
        let label = UILabel.AlcoholicTimePredicton
        greenTimeLabel = label
        view.addSubview(greenTimeLabel)
    }
    
    private func layoutGreenTimeLabel() {
        greenTimeLabel.pin
            .after(of: greenCircleView, aligned: .center)
            .marginLeft(10%)
            .height(of: greenCircleView)
            .right(20)
    }
    
    //MARK: backButton
    
    private func setupBackButton() {
        let button = UIButton.AlcoholicBigButton
        backButton = button
        backButton.setTitle("Назад", for: .normal)
        backButton.addTarget(self, action: #selector(didTapOnBackButton), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    private func layoutBackButton() {
        backButton.pin
            .left(30)
            .right(30)
            .bottom(35)
            .height(5.5%).minHeight(40)
        backButton.makeCuteCornerRadius()
    }
    
}

extension CalculateScreenViewController: CalculateScreenViewInput {
    func setRedTime(time: TimeLeft) {
        redTimeLabel.text = time.stringify
    }
    
    func setYellowTime(time: TimeLeft) {
        yellowTimeLabel.text = time.stringify
    }
    
    func setGreenTime(time: TimeLeft) {
        greenTimeLabel.text = time.stringify
    }
}
