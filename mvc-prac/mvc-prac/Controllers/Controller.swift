//
//  ViewController.swift
//  mvc-prac
//
//  Created by ishraqe manjur on 1/3/19.
//  Copyright © 2019 ishraqe manjur. All rights reserved.
//

import UIKit

class Controller: UIViewController {

    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let samsungProduct = SamsungProduct(name: "Samsung S8", color: "Space Gray", price: 999.99)
        
        modelLabel.text =  samsungProduct.name
        colorLabel.text = "in \(samsungProduct.color)"
        priceLabel.text = "$\(samsungProduct.price)"
        
        let lbl = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
        lbl.textAlignment = .center //For center alignment
        lbl.text = "This is my label fdsjhfg sjdg dfgdfgdfjgdjfhg jdfjgdfgdf end..."
        lbl.textColor = .white
        lbl.backgroundColor = .lightGray//If required
        lbl.font = UIFont.systemFont(ofSize: 17)
        
        //To display multiple lines in label
        lbl.numberOfLines = 0 //If you want to display only 2 lines replace 0(Zero) with 2.
        lbl.lineBreakMode = .byWordWrapping //Word Wrap
        // OR
        lbl.lineBreakMode = .byCharWrapping //Charactor Wrap
        
        lbl.sizeToFit()//If required
        self.view.addSubview(lbl)
        
    }


}

