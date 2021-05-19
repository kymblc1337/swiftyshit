import UIKit
import PinLayout
final class MainScreenViewController: UIViewController {
	var output: MainScreenViewOutput?
    
    private weak var cardCollectionView: UICollectionView!
    private weak var headerView: UIView!
    private weak var calculateButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
        setupUI()
	}
    
    override func viewDidLayoutSubviews() {
        layoutUI()
    }
    
    @objc private func didTapCalculateButton() {
        output?.didTapCalculate()
    }
}

extension MainScreenViewController {
    private func setupUI() {
        setupBackground()
        setupHeaderView()
        setupCollectionView()
        setupCalculateButton()
    }
    
    private func layoutUI() {
        layoutHeaderView()
        layoutCollectionView()
        layoutCalculateButton()
    }
    
    private func setupBackground() {
        view.backgroundColor = UIColor.AlcoholicColors.backgroundColor
    }
    
    //MARK: HeaderView
    
    private func setupHeaderView() {
        let someView = UIView()
        headerView = someView
        headerView.backgroundColor = UIColor.AlcoholicColors.blueColor
        view.addSubview(headerView)
    }
    
    private func layoutHeaderView() {
        headerView.pin
            .top()
            .left()
            .right()
            .height(32%)
    }
    
    //MARK: CollectionView
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = NinjaConstants.screenBounds.width * 0.045
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = NinjaConstants.screenBounds.width * 0.5

        let collect = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cardCollectionView = collect
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        cardCollectionView.backgroundColor = .clear
        cardCollectionView.clipsToBounds = false
        cardCollectionView.showsVerticalScrollIndicator = false
        cardCollectionView.showsHorizontalScrollIndicator = false
        cardCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.className())
        headerView.addSubview(cardCollectionView)
    }
    
    private func layoutCollectionView() {
        cardCollectionView.pin
            .height(68%)
            .left()
            .right()
            .vCenter()
    }
    
    //MARK: CalculateButton
    
    private func setupCalculateButton() {
        let button = UIButton.AlcoholicBigButton
        calculateButton = button
        calculateButton.setTitle("Рассчитать", for: .normal)
        calculateButton.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        view.addSubview(calculateButton)
    }
    
    private func layoutCalculateButton() {
        calculateButton.pin
            .width(84%)
            .hCenter()
            .height(5%)
            .bottom(7%)
        calculateButton.makeCuteCornerRadius()
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.className(), for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)
        -> CGSize {
        return NinjaConstants.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int)
    -> UIEdgeInsets {
        let marginSides = NinjaConstants.screenBounds.width * 0.06
        return UIEdgeInsets(top: 5, left: marginSides, bottom: 5, right: marginSides)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform.identity
        }
    }
}

extension MainScreenViewController: MainScreenViewInput {
    
}
