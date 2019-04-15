import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var sendBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreatePostVC.dismisKeyBoard))
        view.addGestureRecognizer(tap)
        sendBtn.bindToKeyboard()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    @objc func dismisKeyBoard(){
        view.endEditing(true)
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say Something" {
            sendBtn.isEnabled = false
            DataService.instance.postMessage(forMessage: textView.text, forSender: Auth.auth().currentUser!.uid, forGroupKey: nil) { (success) in
                if success {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }else {
                    self.sendBtn.isEnabled = true
                    print("there is an error")
                }
            }
        }
    }
    @IBAction func closebtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
       textView.text = ""
    }
}
