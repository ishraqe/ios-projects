import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var messageTxtBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
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
    @objc func handleTap() {
        view.endEditing(true)
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
        getMessages()
    }
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelId = MessageService.instance.selectedChannel.id else {return}
            guard let message = messageTxtBox.text else {return}
            
            SocketService.instance.addMessage(messageBody: message, channelId: channelId, userId: UserDataService.instance.id) { (success) in
                if success {
                    self.messageTxtBox.text = ""
                    self.messageTxtBox.resignFirstResponder()
                }
            }
        }
    }
    func onLoginGetChannels(){
        MessageService.instance.findAllChannels { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                }else {
                    self.chatLabel.text = "No Channels yet"
                }
            }
        }
    }
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel.id else {return}
        MessageService.instance.findAllMessagesByChannel(channelId: channelId) { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell {
            let message = MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
}
