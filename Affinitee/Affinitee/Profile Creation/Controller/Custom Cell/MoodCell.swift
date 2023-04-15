//
//  MoodCell.swift
//  Affinitee
//
//  Created by Clement Joseph on 06/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit

class MoodCell: UITableViewCell {
    
    
    @IBOutlet weak var moodImage: UIImageView!
    @IBOutlet weak var moodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
