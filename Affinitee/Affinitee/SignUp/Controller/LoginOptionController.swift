//
//  LoginOptionController.swift
//  Affinitee
//
//  Created by Clement Joseph on 15/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit

class LoginOptionController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var phoneLoginButton: UIButton!
    @IBOutlet weak var emailLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        welcomeLabel.font = UIFont(name:FontType.bold , size: FontSize.welcomTitle)
        welcomeLabel.text = NSLocalizedString("WELCOME_NOTE", comment: "Welcome not to be displayed when app opens for the first time")
        
        phoneLoginButton.titleLabel?.font = UIFont(name:FontType.medium , size: FontSize.buttonTitle)
        phoneLoginButton.setTitle(NSLocalizedString("PHONE_LOGIN", comment: "Phone login"), for: .normal)
        phoneLoginButton.layer.cornerRadius = 22.5
        phoneLoginButton.clipsToBounds = true
        
        emailLoginButton.titleLabel?.font = UIFont(name:FontType.medium , size: FontSize.buttonTitle)
        emailLoginButton.setTitle(NSLocalizedString("EMAIL_LOGIN", comment: "Email login"), for: .normal)
        emailLoginButton.layer.cornerRadius = 22.5

        
        
    }
    
    
    //MARK: Actions

    @IBAction func phoneButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func emailButtonClicked(_ sender: Any) {
        
    }
    
    
    @IBAction func termsButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func privacyButtonClicked(_ sender: Any) {
        
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
