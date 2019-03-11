import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func colseCreateVCPressed(_ sender: Any) {
        performSegue(withIdentifier: Unwind, sender: nil)
    }
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    @IBAction func generateAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        guard let email = emailText.text, emailText.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        print(email, pass)
        AuthService.instance.registeruser(email: email, password: pass) { (success) in
            if success {
                print("registered user!")
            }else {
                print("something went wrong")
            }
        }
        
    }
    
   
}
