import UIKit

class GoalVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalbtnPressed(_ sender: Any) {
        print("button was pressed")
    }
    
}

