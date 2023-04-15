//
//  HabitUpdateCell.swift
//  Affinitee
//
//  Created by Clement Joseph on 11/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit


class HabitUpdateCell: UITableViewCell ,ASValueTrackingSliderDataSource {
    
    
    var titlesArray :[String] = []

    @IBOutlet weak var habitImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var habitSlider: ASValueTrackingSlider!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        habitSlider.dataSource = self
        habitSlider.minimumValue = 0
        habitSlider.minimumValue = 0
        habitSlider.maximumValue = 10
        habitSlider.popUpViewCornerRadius = 0.0
        habitSlider.popUpViewArrowLength = 7.0
        
        
        habitSlider.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
        habitSlider.textColor = UIColor.white
        habitSlider.popUpViewColor = UIColor(hue: 0.55, saturation: 0.8, brightness: 0.9, alpha: 0.7)

        
        
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - <ASValueTrackingSliderDataSource>

    @IBAction func habitValueChanged(_ sender: Any) {
        
        
        
    }
    
    
    func slider(_ slider: ASValueTrackingSlider!, stringForValue value: Float) -> String! {
        

        var titleSreing:String = ""
        
        if (value == 0) {
            
            titleSreing = titlesArray[0]
            
        } else if (value > 0 && value < 2.5) {
            
            titleSreing = titlesArray[1]

        }else if (value > 2.5 && value < 5) {
            
            titleSreing = titlesArray[2]

        }else if (value > 5 && value < 7.5) {
            
            titleSreing = titlesArray[3]

        }else if (value > 7.5) {
            
            titleSreing = titlesArray[4]

        }
        
        return titleSreing;
        
        
    }
    
    
    

}
