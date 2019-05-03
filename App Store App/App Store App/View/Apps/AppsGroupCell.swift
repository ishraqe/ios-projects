import UIKit

extension UILabel {
    convenience init(title: String, fontSize: UIFont) {
        self.init(frame: .zero)
        self.text = title
        self.font = font
    }
}


class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel =  UILabel(title: "Apps Section", fontSize: .boldSystemFont(ofSize: 30))

    // HorizontalViewController
    let horizontalVC =  HorizontalController(collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        
        addSubview(horizontalVC.view)
        horizontalVC.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        horizontalVC.view.backgroundColor = .blue
    
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
