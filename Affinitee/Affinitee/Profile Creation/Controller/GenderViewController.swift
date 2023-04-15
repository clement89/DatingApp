//
//  GenderViewController.swift
//  Affinitee
//
//  Created by Clement Joseph on 05/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import LGButton

class GenderViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var maleButton: LGButton!
    @IBOutlet weak var femaleButton: LGButton!
    @IBOutlet weak var transButton: LGButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        titleLabel.text = "Please chose your gender"
        
        
        
        maleButton.titleFontName = FontType.semibold
        maleButton.titleFontSize = FontSize.buttonTitle
        maleButton.titleString = NSLocalizedString("GENDER_MAN", comment: "Gender selection Man")
        
        femaleButton.titleFontName = FontType.semibold
        femaleButton.titleFontSize = FontSize.buttonTitle
        femaleButton.titleString = NSLocalizedString("GENDER_WOMAN", comment: "Gender selection Woman")
        
        transButton.titleFontName = FontType.semibold
        transButton.titleFontSize = FontSize.buttonTitle
        transButton.titleString = NSLocalizedString("GENDER_OTHER", comment: "Gender selection other")
        
        
    }
    
    
    // MARK: - IBAction

    @IBAction func maleButtonClicked(_ sender: Any) {
    
        
        showNextController()
    }
    
    @IBAction func femaleButtonClicked(_ sender: Any) {
    
        showNextController()

    }
    
    @IBAction func transButtonClicked(_ sender: Any) {
        
        showNextController()

    }
    
    
    // MARK: - Private

    
    func showNextController() -> Void {
        
        let storyboard = CommonFunctions.AppStoryboard.ProfileCreation.instance
        let controller = storyboard.instantiateViewController(withIdentifier: "MoodView")
        self.navigationController?.pushViewController(controller, animated: true)
        
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
