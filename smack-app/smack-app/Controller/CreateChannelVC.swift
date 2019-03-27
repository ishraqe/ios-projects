import UIKit

class CreateChannelVC: UIViewController {

    @IBOutlet weak var nextText: UITextField!
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let name = nextText.text, nextText.text != "" else {return}
        guard let desc = descText.text else {return}
        
        SocketService.instance.addChannel(ChannelName: name, ChannelDesc: desc) { (success) in
            if success {
                 self.dismiss(animated: true, completion: nil)
            }
        }
    }
    func setupView(){
        nextText.attributedPlaceholder =  NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: smack_purple_color])
        descText.attributedPlaceholder =  NSAttributedString(string: "Description", attributes: [NSAttributedString.Key.foregroundColor: smack_purple_color])
        
    }
}
