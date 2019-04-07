import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescLbl: UILabel!
    
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    
    func configureCell(goalDes: String, goalType: GoalType, goalAmount: Int){
        self.goalDescLbl.text = goalDes
        self.goalTypeLbl.text = goalType.rawValue
        self.goalProgressLbl.text = String(describing: goalAmount)
    }
}
