import UIKit

class ChatVC: UIViewController {

    
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var chatLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.UserDataDidCanged(_:)), name: NOTIF_USER_DATA_CHANGED, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNELS_DATA_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.finUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
            }
           
        }
    }
    @objc func UserDataDidCanged(_ notif: Notification){
        if AuthService.instance.isLoggedIn {
            onLoginGetChannels()
        }else {
            chatLabel.text = "Please log in"
        }
    }
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
     func updateWithChannel(){
        let channelName = MessageService.instance.selectedChannel?.channelName ?? ""
        chatLabel.text = channelName
    }
    func onLoginGetChannels(){
        MessageService.instance.findAllChannels { (success) in
            if success {
                // do staff
            }
        }
    }
    

}
