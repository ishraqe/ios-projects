//
//  TabBar.swift
//  side-tab
//
//  Created by Ishraqe Manjur on 9/4/19.
//  Copyright © 2019 Ishraqe Manjur. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        // Do any additional setup after loading the view.
    }
    

}
