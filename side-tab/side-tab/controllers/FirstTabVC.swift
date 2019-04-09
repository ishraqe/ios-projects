import UIKit

class FirstTabVC: UIViewController {

    @IBOutlet weak var sideBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        sideBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
      
    }
}
