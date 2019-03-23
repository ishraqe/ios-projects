//
//  ProfileVC.swift
//  smack-app
//
//  Created by ishraqe manjur on 23/3/19.
//  Copyright © 2019 Ishraqe Manjur. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgImage: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

       setUpInfo()
    }

    func setUpInfo() {
        username.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        userImg.image = UIImage(named: UserDataService.instance.avatarName)
         userImg.backgroundColor = UserDataService.instance.returnUiColor(components: UserDataService.instance.avatarColor)
        
    }
    
    
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGED, object: nil)
        dismiss(animated: true, completion: nil)
        
    }
}
