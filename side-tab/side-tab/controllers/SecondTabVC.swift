import UIKit

class SecondTabVC: UIViewController {

    @IBOutlet weak var sideMenuTab: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuTab.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: (.touchUpInside))
       
    }
    



}
