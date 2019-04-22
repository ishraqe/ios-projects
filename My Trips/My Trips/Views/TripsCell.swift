
import UIKit
import Hero

class TripsCell: UITableViewCell {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var placeName: UILabel!
    
    @IBOutlet weak var weatherName: UILabel!
    
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var userImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImg.roundedImage()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        contentView.layer.cornerRadius = 10
        bgImg.layer.cornerRadius = 10
        bgImg.clipsToBounds = true
    }
    func configureCell () {
        self.bgImg.image = UIImage(named: "list-1")
        self.weatherImg.image = UIImage(named: "leaf")
        self.placeName.text = "Crotia"
        self.weatherName.text = "Summer 2016"
        self.durationLbl.text = "8 days"
        self.userImg.image = UIImage(named: "user")
        
        self.bgImg.hero.id = "1"
    }
}
