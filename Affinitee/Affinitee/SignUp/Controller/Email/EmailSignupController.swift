//
//  EmailSignupController.swift
//  Affinitee
//
//  Created by Clement Joseph on 17/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import AwesomeTextFieldSwift

class EmailSignupController: UIViewController {
    
    // MARK: - Property

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailField: AwesomeTextField!
    @IBOutlet weak var passwordField: AwesomeTextField!
    @IBOutlet weak var confirmPasswordField: AwesomeTextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var viewModel = LoginViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()

        
        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        titleLabel.text = NSLocalizedString("SIGN_UP_TITLE", comment: "Sign up page title")
        
        
        
        emailField.placeholder = NSLocalizedString("EMAIL_PLACEHOLDE", comment: "Email field placeholder text")
        emailField.font = UIFont(name:FontType.medium , size: FontSize.textField)
        
        passwordField.placeholder = NSLocalizedString("PASSWORD_PLACEHOLDE", comment: "Password field placeholder text")
        passwordField.font = UIFont(name:FontType.medium , size: FontSize.textField)
        
        confirmPasswordField.placeholder = NSLocalizedString("CONFIRM_PASSWORD_PLACEHOLDE", comment: "onfirm Password field placeholder text")
        confirmPasswordField.font = UIFont(name:FontType.medium , size: FontSize.textField)
        
        
        
        signupButton.titleLabel?.font = UIFont(name:FontType.medium , size: FontSize.buttonTitle)
        signupButton.setTitle(NSLocalizedString("SIGN_UP", comment: "Sign up button title"), for: .normal)
        signupButton.layer.cornerRadius = 22.5
        signupButton.clipsToBounds = true
        
        
        
    }
    
    
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        
        if(emailField.text == ""){
            self.showAlert(message: NSLocalizedString("EMAIL_ALERT", comment: "Alert shown when email field left empty"))
            return
        }
        
        if(passwordField.text == ""){
            self.showAlert(message: NSLocalizedString("PASSWORD_ALERT", comment: "Alert shown when password field left empty"))
            return
        }
        
        if(confirmPasswordField.text == ""){
            self.showAlert(message: NSLocalizedString("CONFIRM_PASSWORD_ALERT", comment: "Alert shown when confirm password left empty"))
            return
        }
        
        if(confirmPasswordField.text != passwordField.text ){
            self.showAlert(message: NSLocalizedString("PASSWORD_MISMATCH_ALERT", comment: "Alert shown when passwords don't match"))
            return
        }
        
        
        
        
        viewModel.signupUsingCredentials(email: emailField.text! , password: passwordField.text! , completionHandler:
            { (_ success:Bool , _ error: Error?) -> Void in
                
                // When download completes,control flow goes here.
                if success {
                    // download success
                    print("Signup success")
                    
                } else {
                    // download fail
                    print("Signup Fail")
                    
                }
        })
        
        
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
