import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    // Default variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor:  UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func colseCreateVCPressed(_ sender: Any) {
        performSegue(withIdentifier: Unwind, sender: nil)
    }
    @IBAction func chooseAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    @IBAction func generateAvatarPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
         let g = CGFloat(arc4random_uniform(255)) / 255
         let b = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        self.userImg.backgroundColor = bgColor
    }
    
    @IBAction func createAccount(_ sender: Any) {
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let email = emailText.text, emailText.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthService.instance.registeruser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarColor: self.avatarColor, avatarName: self.avatarName, completion: { (success) in
                            if success {
                                print(UserDataService.instance.avatarColor)
                                self.performSegue(withIdentifier: Unwind, sender: nil)
                            }
                        })
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
