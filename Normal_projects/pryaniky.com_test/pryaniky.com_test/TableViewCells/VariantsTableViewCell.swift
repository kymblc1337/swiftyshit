import Foundation
import UIKit
import PinLayout

// debug - check links to TableViewCell
// prepare for reuse

class VariantsTableViewCell: UITableViewCell {
    private weak var postSegment: UISegmentedControl!
    var output: MainScreenViewOutput?
    
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
    
//    override func prepareForReuse() {
//        //code
//    }
    
    public func configure(with model: VariatnsModel) {
        let semgent = UISegmentedControl(items: model.items)
        postSegment = semgent
        postSegment.addTarget(self, action: #selector(didSelectSegment), for: .valueChanged)
        postSegment.selectedSegmentIndex = model.selectedId - 1
        contentView.addSubview(postSegment)
    }
    
    @objc private func didSelectSegment() {
        guard let segmentName = postSegment.titleForSegment(at: postSegment.selectedSegmentIndex) else { return }
        output?.didSelectSegment(segmentName: segmentName)
    }
}

extension VariantsTableViewCell {
    private func setupUI() {
        setupView()
        setupSegment()
    }
    
    private func layoutUI() {
        layoutSegment()
    }
    
    private func setupView() {
        contentView.backgroundColor = UIColor(red: 254/255, green: 226/255, blue: 94/255, alpha: 1)
    }
    
    private func setupSegment() {
        let segment = UISegmentedControl(items: [])
        postSegment = segment
        postSegment.addTarget(self, action: #selector(didSelectSegment), for: .valueChanged)
        contentView.addSubview(postSegment)
    }
    
    private func layoutSegment() {
        postSegment.pin
            .all()
    }
}
