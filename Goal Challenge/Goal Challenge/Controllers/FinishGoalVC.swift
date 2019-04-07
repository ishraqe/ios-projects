import UIKit

class FinishGoalVC: UIViewController {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTxtField: UITextField!
    var goalDesc: String!
    var goalType: GoalType!
    
    
    func initData(goalDesc: String, goalType: GoalType){
        self.goalDesc = goalDesc
        self.goalType = goalType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyBoard()
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        // send to core data
    }
    
}
