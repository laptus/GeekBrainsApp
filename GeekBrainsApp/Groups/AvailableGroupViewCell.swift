//
//  AvailableGroupViewCell.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 04/12/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import UIKit

class AvailableGroupViewCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupParticipantsCount: UILabel!
    @IBOutlet weak var groupAvaterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
