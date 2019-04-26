import UIKit
import Foundation

class headerCell: UICollectionViewCell {
 
    override init(frame: CGRect,reuseIdentifier: String? ) {
        super.init(frame: frame, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label = UILabel()
   
    func configurecell(reuseIdentifier: String?) {
        label.text = "Im the header"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        
        contentView.addSubview(label)
    }
    
}
