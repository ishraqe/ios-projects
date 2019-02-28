import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func updateProduct(product: Product)  {
        productImage.image = UIImage(named: product.image)
        productLabel.text = product.title
        priceLabel.text = product.price
    }
}
 
