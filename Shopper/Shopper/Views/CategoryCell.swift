import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func updateView(category: Category) {
        categoryImage.image =  UIImage(named: category.imgName)
        categoryLabel.text =  category.title
    }
}
