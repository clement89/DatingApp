//
//  HabitCell.swift
//  Affinitee
//
//  Created by Clement Joseph on 10/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit

class HabitCell: UITableViewCell {
    
    @IBOutlet weak var habitImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
