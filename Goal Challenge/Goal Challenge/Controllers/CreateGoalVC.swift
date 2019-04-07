
import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalDesc: UITextView!
    
    @IBOutlet weak var longTermBtn: UIButton!
    
    @IBOutlet weak var shortTermBtn: UIButton!
   
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyBoard()
        // Do any additional setup after loading the view.
        shortTermBtn.setSelectedColor()
        longTermBtn.setDelectedColor()
    }
    
    @IBAction func shortTrmBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDelectedColor()
    }
    
    @IBAction func longTrmBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDelectedColor()
    }
  
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if goalDesc.text != "" && goalDesc.text != "Whats your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(goalDesc: goalDesc.text, goalType: goalType)
            presentDetail(finishGoalVC)
        }
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
}
