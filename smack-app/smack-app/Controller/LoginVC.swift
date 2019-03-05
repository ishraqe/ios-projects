import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func closeLoginPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
