import UIKit
import PinLayout

class CardCollectionViewCell: UICollectionViewCell {
    weak var output: MainScreenPresenter?
    
    private weak var drinkNameTextFeild: UITextField!
    private weak var drinkDegreeTextFeild: UITextField!
    private weak var drinkVolumeTextFeild: UITextField!
    private weak var addButton: ButtonWithTouchableArea!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutUI()
    }
    
    func setDrinkNameText(text: String) {
        drinkNameTextFeild.text = text
    }
    
    func setDrinkDegreeText(text: String) {
        drinkDegreeTextFeild.text = text
    }
    
    func setDrinkVolumeTextFeild(text: String) {
        drinkVolumeTextFeild.text = text
    }
    
    @objc private func didTapAddButton() {
        debugPrint("Jopa")
    }
}

extension CardCollectionViewCell {
    private func setupUI() {
        setupCard()
        setupDrinkNameTextFeild()
        setupDrinkDegreeTextFeild()
        setupDrinkVolumeTextFeild()
        setupAddButton()
        dropShadow()
    }
    
    private func layoutUI() {
        layoutDrinkNameTextFeild()
        layoutDrinkDegreeTextFeild()
        layoutDrinkVolumeTextFeild()
        layoutAddButton()
        
    }
    
    //MARK: MainCard
    
    private func setupCard() {
        self.backgroundColor = UIColor.AlcoholicColors.cardColor
        self.clipsToBounds = false
        self.layer.cornerRadius = self.bounds.height * 0.08
    }
    
    //MARK: DrinkNameTextFeild
    
    private func setupDrinkNameTextFeild() {
        let textField = UITextField.createAlcoholicTextField()
        drinkNameTextFeild = textField
        drinkNameTextFeild.text = "Пиво"
        contentView.addSubview(drinkNameTextFeild)
    }
    
    private func layoutDrinkNameTextFeild() {
        drinkNameTextFeild.pin
            .height(17%)
            .width(92%).hCenter()
            .top(8%)
        drinkNameTextFeild.makeCuteCornerRadius()
    }
    
    //MARK: DrinkDegreeTextFeild
    
    private func setupDrinkDegreeTextFeild() {
        let textField = UITextField.createAlcoholicTextField()
        drinkDegreeTextFeild = textField
        drinkDegreeTextFeild.text = "4°"
        contentView.addSubview(drinkDegreeTextFeild)
    }
    
    private func layoutDrinkDegreeTextFeild() {
        drinkDegreeTextFeild.pin
            .height(17%)
            .width(92%).hCenter()
            .top(to: drinkNameTextFeild.edge.bottom).marginTop(4.5%)
        drinkDegreeTextFeild.makeCuteCornerRadius()
    }
    
    //MARK: DrinkVolumeTextFeild
    
    private func setupDrinkVolumeTextFeild() {
        let textField = UITextField.createAlcoholicTextField()
        drinkVolumeTextFeild = textField
        drinkVolumeTextFeild.isUserInteractionEnabled = true
        drinkVolumeTextFeild.placeholder = "100 мл"
        drinkVolumeTextFeild.textAlignment = .center
        drinkVolumeTextFeild.keyboardType = .numberPad
        contentView.addSubview(drinkVolumeTextFeild)
    }
    
    private func layoutDrinkVolumeTextFeild() {
        drinkVolumeTextFeild.pin
            .height(17%)
            .width(92%).hCenter()
            .top(to: drinkDegreeTextFeild.edge.bottom).marginTop(4.5%)
        drinkVolumeTextFeild.makeCuteCornerRadius()
    }

    //MARK: AddButton
    
    private func setupAddButton() {
        let button = ButtonWithTouchableArea(type: .roundedRect)
        addButton = button
        addButton.backgroundColor = UIColor.AlcoholicColors.cardButtonColor
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.AlcoholicColors.buttonStrokeColor.cgColor
        addButton.setTitle("Добавить", for: .normal)
        addButton.titleLabel?.font = UIFont.AlcoholicFonts.bold18
        addButton.setTitleColor(UIColor.AlcoholicColors.textColor, for: .normal)
        contentView.addSubview(addButton)
    }
    
    private func layoutAddButton() {
        addButton.pin
            .height(17%)
            .width(92%).hCenter()
            .top(to: drinkVolumeTextFeild.edge.bottom).marginTop(4.5%)
        addButton.makeCuteCornerRadius()
    }
}
