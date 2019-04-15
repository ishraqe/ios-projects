
import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    
    func configureCell(profileImg: UIImage, email: String, message: String ){
        self.profileImg.image = profileImg
        self.userEmailLbl.text = email
        self.msgLbl.text = message
    }
}
