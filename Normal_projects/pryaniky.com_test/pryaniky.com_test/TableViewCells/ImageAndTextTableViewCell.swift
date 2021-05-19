import Foundation
import UIKit
import PinLayout
import Kingfisher

class ImageAndTextTableViewCell: UITableViewCell {
    private weak var postTitle: UILabel!
    private weak var postImageView: UIImageView!
    
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
    
    public func configure(with model: ImageWithTextModel) {
        postTitle.text = model.text
        let imageUrl = URL(string: model.url)
        postImageView.kf.setImage(with: imageUrl)
    }
}

extension ImageAndTextTableViewCell {
    
    private func setupUI() {
        setupView()
        setupLabel()
        setupImage()
    }
    
    private func layoutUI() {
        layoutLabel()
        layoutImage()
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor(red: 89/255, green: 201/255, blue: 165/255, alpha: 1)
    }
    
    //MARK: Label
    private func setupLabel() {
        let label = UILabel()
        postTitle = label
        postTitle.textColor = .black
        postTitle.textAlignment = .center
        self.addSubview(postTitle)
    }
    
    private func layoutLabel() {
        postTitle.pin
            .left()
            .right()
            .height(20%)
            .bottom()
    }
    
    //MARK: Image
    
    private func setupImage() {
        let image = UIImageView()
        postImageView = image
        postImageView.contentMode = .scaleAspectFit
        self.addSubview(postImageView)
    }
    
    private func layoutImage() {
        postImageView.pin
            .left()
            .right()
            .top()
            .height(80%)
    }
}
