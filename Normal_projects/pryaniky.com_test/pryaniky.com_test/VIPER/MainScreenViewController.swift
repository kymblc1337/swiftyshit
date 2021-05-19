import UIKit
import PinLayout

// something holds tableView cell
// case - https://chat.pryaniky.com/json/data-default-order-very-very-long-view.json


final class MainScreenViewController: UIViewController {
	var output: MainScreenViewOutput?
    // не объязательно weak ссылка
    private weak var postsTableView: UITableView!

    

	override func viewDidLoad() {
		super.viewDidLoad()
        setupUI()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutUI()
    }
    
}

extension MainScreenViewController: MainScreenViewInput {
    func updateTableView() {
        postsTableView.reloadData()
    }
    
    
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output?.numbersOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didTapOnCell(index: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let post = output?.getCellAtIndex(index: indexPath) else { return 100 }
        guard let type = post.type else { return 100 }
        switch type {
        case PostTypes.textOnlyModel.name:
            return 50
        case PostTypes.imageWithTextModel.name:
            return 200
        case PostTypes.variatnsModel.name:
            return 50
        default:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let post = output?.getCellAtIndex(index: indexPath) else { return UITableViewCell() }
        guard let type = post.type else { return UITableViewCell() }
        
        if type == PostTypes.textOnlyModel.name {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTypes.textOnlyModel.name, for: indexPath) as? TextOnlyTableViewCell else {
                        return UITableViewCell()
                    }
            guard let textPost = post as? TextOnlyModel else {
                return UITableViewCell() }
            cell.configure(with: textPost)
            return cell
        } else if type == PostTypes.imageWithTextModel.name {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTypes.imageWithTextModel.name, for: indexPath) as? ImageAndTextTableViewCell else {
                        return UITableViewCell()
                    }
            guard let imagePost = post as? ImageWithTextModel else {
                return UITableViewCell() }
            cell.configure(with: imagePost)
            return cell
            
        } else if type == PostTypes.variatnsModel.name {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTypes.variatnsModel.name, for: indexPath) as? VariantsTableViewCell else {
                        return UITableViewCell()
                    }
            guard let segmentPost = post as? VariatnsModel else {
                return UITableViewCell() }
            cell.configure(with: segmentPost)
            cell.output = self.output
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension MainScreenViewController {
    private func setupUI() {
        setupView()
        setupTableView()
        output?.didLoadView()
    }
    
    private func layoutUI() {
        layoutTableView()
    }
    
    //MARK: View settings
    private func setupView() {
        view.backgroundColor = .white
    }
    
    //MARK: TableView settings
    private func setupTableView() {
        let table = UITableView()
        postsTableView = table
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(ImageAndTextTableViewCell.self, forCellReuseIdentifier: PostTypes.imageWithTextModel.name)
        postsTableView.register(TextOnlyTableViewCell.self, forCellReuseIdentifier: PostTypes.textOnlyModel.name)
        postsTableView.register(VariantsTableViewCell.self, forCellReuseIdentifier: PostTypes.variatnsModel.name)
        
        postsTableView.separatorStyle = .none
        view.addSubview(postsTableView)
    }
    
    private func layoutTableView() {
        postsTableView.pin
            .all()
    }
    
}
