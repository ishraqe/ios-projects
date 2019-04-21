

import UIKit

class TripsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension TripsVC: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "tripsCell", for: indexPath) as? TripsCell else {return UITableViewCell()}
        cell.configureCell(weatherImg: UIImage(named: "sunny_1x")!, tripPlace: "Crotia", timeLbl: "Summer 2019", durationLbl: "10 days", profileImg: UIImage(named: "user")!, bgImg:  UIImage(named: "sunny_1x")!)
    
        return cell
    }
    
    
}
