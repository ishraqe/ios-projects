import UIKit
import CoreData

let appDeleagte = UIApplication.shared.delegate as? AppDelegate

class GoalVC: UIViewController {
    var goals: [Goal] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchObjectsFromCoreData()
         tableView.reloadData()
    }
    func fetchObjectsFromCoreData(){
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                    
                } else {
                    tableView.isHidden = true
                    
                }
            }
        }
    }
    @IBAction func addGoalbtnPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else {return}
        presentDetail(createGoalVC)
    }
    
}

extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeData(atIndexPath: indexPath)
            self.fetchObjectsFromCoreData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .destructive, title: "ADD 1") { (rowAction, indexPath) in
           self.setProgress(atIndexPath: indexPath)
           tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.4922404289, green: 0.7722371817, blue: 0.4631441236, alpha: 1)
        return [deleteAction, addAction]
    }
}

extension GoalVC {
    
    func setProgress(atIndexPath indexPath: IndexPath){
         guard let managedContext = appDeleagte?.persistentContainer.viewContext else {return}
        
        let choosenGoal =  goals[indexPath.row]
        if choosenGoal.goalProgress < choosenGoal.goalCompletionVal {
                choosenGoal.goalProgress = choosenGoal.goalProgress + 1
        }else{
            return
        }
        
        do {
            try managedContext.save()
            print("Successfully removed content")
            
        } catch  {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            
        }
    }
    
    func removeData(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDeleagte?.persistentContainer.viewContext else {return}
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("Successfully removed content")
           
        } catch  {
            debugPrint("Could not fetch: \(error.localizedDescription)")
          
        }
    }
    
    
    func fetch(completion: (_ complete: Bool)->()) {
        guard let managedContext = appDeleagte?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            print("fetched")
            completion(true)
        } catch  {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
        
    }
}
