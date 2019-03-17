import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
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
        
        AuthService.instance.registeruser(email: email, password: pass) { (success) in
            if success {
               
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("user logged in", AuthService.instance.authToken)
                    }
                }
                )
                
                
            }else {
                print("something went wrong")
            }
        }
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
   
}
