import UIKit

class BeautifulCard: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        layer.cornerRadius = 20
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 5
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 10
    }
  
}
