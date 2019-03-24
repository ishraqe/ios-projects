//
//  ChannelCell.swift
//  smack-app
//
//  Created by ishraqe manjur on 24/3/19.
//  Copyright © 2019 Ishraqe Manjur. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configCell(channel: Channel) {
        let title = channel.channelName ?? ""
        channelName.text = "#\(title)"
    }

}
