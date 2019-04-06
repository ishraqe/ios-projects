import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var sideMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
    }
}
