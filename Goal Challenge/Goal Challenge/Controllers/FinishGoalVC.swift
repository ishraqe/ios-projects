import UIKit
import CoreData
class FinishGoalVC: UIViewController {

 
    @IBOutlet weak var pointsTxtField: UITextField!
    var goalDesc: String!
    var goalType: GoalType!
    
    @IBOutlet weak var createGoalBtn: UIButton!
    
    func initData(goalDesc: String, goalType: GoalType){
        self.goalDesc = goalDesc
        self.goalType = goalType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyBoard()
         let tap = UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismisKeyboard () {
        view.endEditing(true)
    }
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTxtField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    func save(completion: (_ finished: Bool)->()){
        guard let managedContext = appDeleagte?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDesc
        goal.goalType = goalType.rawValue
        goal.goalCompletionVal = Int32(pointsTxtField.text!)!
        goal.goalProgress =  Int32(0)
        do {
           try managedContext.save()
            print("successfully saved data")
            completion(true)
        } catch  {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
