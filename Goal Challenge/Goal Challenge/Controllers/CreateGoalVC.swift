
import UIKit

class CreateGoalVC: UIViewController {
    
    @IBOutlet weak var goalDesc: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func shortTrmBtnWasPressed(_ sender: Any) {
    }
    @IBAction func longTrmBtnWasPressed(_ sender: Any) {
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}
