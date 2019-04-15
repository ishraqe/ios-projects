import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var emailTxt: insertTextField!
    
    @IBOutlet weak var passTxt: insertTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxt.delegate = self
        passTxt.delegate = self
       
    }

    @IBAction func signInBtnWasPressed(_ sender: Any) {
        if emailTxt.text != nil && passTxt.text != nil {
            AuthService.instance.loginUser(withEmail: emailTxt.text!, andPass: passTxt.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else {
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.regUser(withEmail: self.emailTxt.text!, andPass: self.passTxt.text!, createUserCompletion: { (success, regError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTxt.text!, andPass: self.passTxt.text!, loginUserCompletion: { (success, loginError) in
                            if success {
                                print("Succesfully reg and logged in user")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    }else {
                        print(String(describing: regError?.localizedDescription))
                    }
                })
            }
        }
    }
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC:  UITextFieldDelegate {}
