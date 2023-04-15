//
//  NameViewController.swift
//  Affinitee
//
//  Created by Clement Joseph on 01/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import PMSuperButton
import AwesomeTextFieldSwift


class NameViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var nameText: AwesomeTextField!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var dobButton: UIButton!
    @IBOutlet weak var continueButton: PMSuperButton!
    
    @IBOutlet weak var dobBorderView: UIView!
    
    
    
    // MARK: Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.hideKeyboardWhenTappedAround()

        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        titleLabel.text = NSLocalizedString("PROFILE_CREATION_TITLE", comment: "Profile creation page title")
        
        
        infoLabel.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
        infoLabel.text = NSLocalizedString("PROFILE_CREATION_SUBTITLE", comment: "Profile creation page subtitle")
        
        
        nameText.placeholder = NSLocalizedString("NAME_PLACEHOLDER", comment: "Name field placeholder text")
        nameText.font = UIFont(name:FontType.medium , size: FontSize.textField)
        
        dobButton.titleLabel?.font = UIFont(name:FontType.medium , size: FontSize.textField)
        dobButton.setTitle(NSLocalizedString("BIRTHDAY_PLACEHOLDER", comment: "Birthday field placeholder text"), for: .normal)
        
    }
    
    
    
    @IBAction func dateButtonAction(_ sender: Any) {
        

        
        let alert = UIAlertController(title:nil, message: NSLocalizedString("BIRTHDAY_PLACEHOLDER", comment: "Birthday field placeholder text"), preferredStyle: UIAlertController.Style.actionSheet)
        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: nil) { date in
            Log(date)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show()
        
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
