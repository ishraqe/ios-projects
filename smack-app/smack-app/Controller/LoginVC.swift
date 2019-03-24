import UIKit

class LoginVC: UIViewController {

    
   
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pasTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
   
    @IBAction func closeLoginPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: To_Create_Account  , sender: nil)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = true
        spinner.startAnimating()
        
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
         guard let password = pasTxt.text, pasTxt.text != "" else {return}
        print(email, password)
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if(success){
                AuthService.instance.finUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    func setupView() {
        spinner.isHidden = true
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor:  smack_purple_color])
        
        pasTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor :  smack_purple_color])
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
