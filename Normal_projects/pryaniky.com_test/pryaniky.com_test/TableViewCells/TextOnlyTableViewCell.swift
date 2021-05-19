import Foundation
import UIKit
import PinLayout

class TextOnlyTableViewCell: UITableViewCell {
    private weak var postTitle: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        layoutUI()
    }
    
    public func configure(with model: TextOnlyModel) {
        postTitle.text = model.text
    }
}

extension TextOnlyTableViewCell {
    private func setupUI() {
        setupView()
        setupLabel()
    }
    
    private func layoutUI() {
        layoutLabel()
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor(red: 175/255, green: 203/255, blue: 254/255, alpha: 1)
    }
    
    private func setupLabel() {
        let label = UILabel()
        postTitle = label
        postTitle.textColor = .black
        postTitle.textAlignment = .center
        self.addSubview(postTitle)
    }
    
    private func layoutLabel() {
        postTitle.pin
            .all()
    }
}
