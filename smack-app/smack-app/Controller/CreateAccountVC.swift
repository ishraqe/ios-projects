//
//  CreateAccountVC.swift
//  smack-app
//
//  Created by Ishraqe Manjur on 5/3/19.
//  Copyright © 2019 Ishraqe Manjur. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func colseCreateVCPressed(_ sender: Any) {
        performSegue(withIdentifier: Unwind, sender: nil)
    }
    
}
