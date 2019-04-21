
import UIKit

@IBDesignable
class TripsCell: UITableViewCell {
    @IBOutlet weak var weatherImg: UIImageView!
    
    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var tripPlace: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.roundedImage()
    }
    
    func configureCell(weatherImg: UIImage, tripPlace: String, timeLbl: String, durationLbl: String, profileImg: UIImage, bgImg: UIImage) {
        
        self.weatherImg.image = weatherImg
        self.tripPlace.text = tripPlace
        self.timeLbl.text = timeLbl
        self.durationLbl.text = durationLbl
        self.profileImg.image = profileImg
        self.bgView.image = bgImg
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20))
    }
}
