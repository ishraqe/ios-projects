//
//  CreateChannelVC.swift
//  smack-app
//
//  Created by ishraqe manjur on 27/3/19.
//  Copyright © 2019 Ishraqe Manjur. All rights reserved.
//

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
    }
    func setupView(){
        nextText.attributedPlaceholder =  NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: smack_purple_color])
        descText.attributedPlaceholder =  NSAttributedString(string: "Description", attributes: [NSAttributedString.Key.foregroundColor: smack_purple_color])
        
    }
}
