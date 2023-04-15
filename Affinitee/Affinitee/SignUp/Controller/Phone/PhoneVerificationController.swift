//
//  PhoneVerificationController.swift
//  Affinitee
//
//  Created by Clement Joseph on 17/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import AwesomeTextFieldSwift
import LGButton

class PhoneVerificationController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Property

    @IBOutlet weak var verificationLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var verificationText: AwesomeTextField!
    
    @IBOutlet weak var verifyButton: LGButton!
    
    let viewModel = PhoneNumberViewModel()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()

        
        verificationLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        verificationLabel.text = NSLocalizedString("ENTER_VERIFICATION_CODE", comment: "Verification window title")
        
        infoLabel.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
        infoLabel.text = NSLocalizedString("PHONE_NUMBER_VERIFICATION_SUBTITLE", comment: "A verification code has benn send to {users phone number}")
        
        verificationText.placeholder = NSLocalizedString("SMS_CODE_PLACEHOLDE", comment: "SMS Code field placeholder text")
        verificationText.font = UIFont(name:FontType.medium , size: FontSize.textField)
        if #available(iOS 12.0, *) {
            verificationText.textContentType = UITextContentType.oneTimeCode
        } else {
            // Fallback on earlier versions
        }
        verificationText.delegate = self;
        
      
        
        verifyButton.titleFontName = FontType.semibold
        verifyButton.titleFontSize = FontSize.buttonTitle
        verifyButton.titleString = NSLocalizedString("VERIFY_BUTTON_TITLE", comment: "Verify button title")
        verifyButton.loadingString = NSLocalizedString("VERIFY_BUTTON_TITLE", comment: "Verify button title")
        verifyButton.loadingFontName = FontType.semibold
        verifyButton.loadingFontSize = FontSize.buttonTitle
        
        
    }
    

    // MARK: - UITextFieldDelegate
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        textField.text = formattedNumber(number: newString)
        return false
    }
    
    // MARK: - Private
    
    
    private func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "X - X - X - X - X - X"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    // MARK: - IBAction
    
    
    
    @IBAction func verifyButtonClicked(_ sender: LGButton) {
        
        guard let verificationCode = verificationText.text else {
            
            self.showAlert(message: NSLocalizedString("PHONE_NUMBER_ALERT", comment: "Alert shown when phone number is empty"))

            return
        }
        
        sender.isLoading = true
        
        
        viewModel.signInWithVerificationCode(verificationCode: verificationCode) { (_ success:Bool , _ error: Error?) -> Void in
            
            
            sender.isLoading = false
            
            if success {
                // download success
                print("Login success")
                
            } else {
                // download fail
                self.showAlert(message: error?.localizedDescription ?? "Error")

            }
        }
        
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
