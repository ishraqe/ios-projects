

import UIKit

class InitialVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        // Sets the status bar to hidden when the view has finished appearing
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Sets the status bar to visible when the view is about to disappear
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showVC), userInfo: nil, repeats: false)
    }
    
    @objc func showVC(){
        guard  let tripsVC =  storyboard?.instantiateViewController(withIdentifier: "TripsVC") else {return}
        
        self.present(tripsVC, animated: true, completion: nil)
    }
}

