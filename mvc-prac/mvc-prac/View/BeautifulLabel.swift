//
//  BeautifulLabel.swift
//  mvc-prac
//
//  Created by ishraqe manjur on 1/3/19.
//  Copyright © 2019 ishraqe manjur. All rights reserved.
//

import UIKit

class BeautifulLabel: UILabel {

    override func awakeFromNib() {
        layer.shadowColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 10
    }

}
