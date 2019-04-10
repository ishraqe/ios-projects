import UIKit

@IBDesignable
class ShadowView: UIView {

    override func awakeFromNib() {
        
    
        

        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5.0
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
        
    }

}
