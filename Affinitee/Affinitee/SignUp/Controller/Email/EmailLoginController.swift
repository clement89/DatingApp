//
//  EmailLoginController.swift
//  Affinitee
//
//  Created by Clement Joseph on 17/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import AwesomeTextFieldSwift
import LGButton


class EmailLoginController: UIViewController {

    // MARK: - Property

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailField: AwesomeTextField!
    @IBOutlet weak var passwordField: AwesomeTextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var emailBorder: UIView!
    @IBOutlet weak var passwordBorder: UIView!
    
    @IBOutlet weak var loginButton: LGButton!
    
    
    var viewModel = LoginViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()

        
        
        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        titleLabel.text = NSLocalizedString("LOGIN_TITLE", comment: "Login page title")
        
        
        
        emailField.placeholder = NSLocalizedString("EMAIL_PLACEHOLDE", comment: "Email field placeholder text")
        emailField.font = UIFont(name:FontType.medium , size: FontSize.textField)
        
        passwordField.placeholder = NSLocalizedString("PASSWORD_PLACEHOLDE", comment: "Password field placeholder text")
        passwordField.font = UIFont(name:FontType.medium , size: FontSize.textField)
        
        
        
        loginButton.titleFontName = FontType.semibold
        loginButton.titleFontSize = FontSize.buttonTitle
        loginButton.titleString = NSLocalizedString("LOGIN", comment: "Login button title")
        loginButton.loadingString = NSLocalizedString("LOGIN", comment: "Login button title")
        loginButton.loadingFontName = FontType.semibold
        loginButton.loadingFontSize = FontSize.buttonTitle

        
        
        createAccountButton.titleLabel?.font = UIFont(name:FontType.semibold , size: FontSize.subTitle)
        createAccountButton.setTitle(NSLocalizedString("CREATE_ACCOUNT_TITLE", comment: "Create new account button title"), for: .normal)
        createAccountButton.titleLabel?.numberOfLines = 1
        createAccountButton.titleLabel?.adjustsFontSizeToFitWidth = true
        createAccountButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping

        

       
        
        
    }
    @IBAction func loginButtonAction(_ sender: LGButton) {
        

        if(emailField.text == ""){
            emailBorder.backgroundColor = Color.themeColor
            self.showAlert(message: NSLocalizedString("EMAIL_ALERT", comment: "Alert shown when email field left empty"))
            return
        }else{
            emailBorder.backgroundColor = UIColor.lightGray
        }
        
        if(passwordField.text == ""){
            passwordBorder.backgroundColor = Color.themeColor
            self.showAlert(message: NSLocalizedString("PASSWORD_ALERT", comment: "Alert shown when password field left empty"))
            return
        }else{
            passwordBorder.backgroundColor = UIColor.lightGray
        }
        
        
        sender.isLoading = true

        viewModel.loginUsingCredentials(email: emailField.text! , password: passwordField.text! , completionHandler:
            { (_ success:Bool , _ error: Error?) -> Void in
                

                sender.isLoading = false

                if success {
                    // download success
                    print("Login success")
                    
                } else {
                    // download fail
                    print("Login Error")
                    
                }
        })
        
        
    }
    

    
    // MARK: - Private



}



// Put this piece of code anywhere you like

