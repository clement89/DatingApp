//
//  PhoneNumberController.swift
//  Affinitee
//
//  Created by Clement Joseph on 17/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import AwesomeTextFieldSwift
import LGButton

class PhoneNumberController: UIViewController,UITextFieldDelegate {
    
    // MARK: - Property
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var phoneNumberField: AwesomeTextField!
    
    @IBOutlet weak var continuButton: LGButton!
    
    
    let viewModel = PhoneNumberViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()


        
        phoneNumberLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        phoneNumberLabel.text = NSLocalizedString("ENTER_PHONE_NUMBER", comment: "Title on Phone number screen")
        
        infoLabel.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
        infoLabel.text = NSLocalizedString("ENTER_PHONE_NUMBER_SUBTITLE", comment: "Sub title on phone number screen")
        
        phoneNumberField.placeholder = NSLocalizedString("PHONE_NUMBER_PLACEHOLDE", comment: "Phone number field placeholder text")
        phoneNumberField.font = UIFont(name:FontType.medium , size: FontSize.textField)
        phoneNumberField.delegate = self;
        
        countryButton.titleLabel?.font = UIFont(name:FontType.medium , size: FontSize.textField)        
        countryButton.setTitle(getCountryString(), for: .normal)
        

     
        continuButton.titleFontName = FontType.semibold
        continuButton.titleFontSize = FontSize.buttonTitle
        continuButton.titleString = NSLocalizedString("CONTINUE_BUTTON_TITLE", comment: "Continue button title")
        continuButton.loadingString = NSLocalizedString("CONTINUE_BUTTON_TITLE", comment: "Continue button title")
        continuButton.loadingFontName = FontType.semibold
        continuButton.loadingFontSize = FontSize.buttonTitle
        
        
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
        let mask = "(XXX) XXX-XXXX"
        
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
    
    private func getCountryString() -> String {
        var country :CountrySelectionModel?
        country = viewModel.getCurrentCuntry()
        return country?.dialCode ?? ""
    }
    
    
    // MARK: - IBAction

   
    
    @IBAction func continueButtonClicked(_ sender: LGButton) {
    
        let phoneText :String = phoneNumberField.text ?? ""
        let countryText :String = countryButton.titleLabel?.text ?? ""
        
        
        if(phoneText == ""){
            self.showAlert(message: NSLocalizedString("PHONE_NUMBER_ALERT", comment: "Alert shown when phone number is empty"))
            return
        }
        
        if(countryText == ""){
            
            self.showAlert(message: NSLocalizedString("COUNTRY_CODE_ALERT", comment: "Alert shown when country code left empty"))
            return
        }
        
        sender.isLoading = true
        

        
        let phoneNumber :String = countryText + phoneText

        Log(phoneNumber)

        viewModel.loginUsingPhoneNumber(phone: phoneNumber) { (_ success:Bool , _ error: Error?) -> Void in
            
            
            sender.isLoading = false
            
            if success {
                // download success
                print("Login success")
                
                let storyboard = CommonFunctions.AppStoryboard.SignUp.instance
                let controller = storyboard.instantiateViewController(withIdentifier: "PhoneVerification")
                self.navigationController?.pushViewController(controller, animated: true)
                
            } else {
                // download fail

                self.showAlert(message: error?.localizedDescription ?? "Error")

            }
        }
    
    }
    
    
    @IBAction func countryButtonClicked(_ sender: Any) {
        
        
        let alert = UIAlertController(style: UIAlertController.Style.actionSheet)
        alert.addLocalePicker(type: .country) { info in Log(info) }//phoneCode country
        alert.addAction(title: NSLocalizedString("CANCEL", comment: "Cancel"), style: .cancel)
        alert.show()
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        
//        if segue.destination is CountrySelectionController
//        {
//            
//            let vc = segue.destination as? CountrySelectionController
//            vc?.completionHandler = { country in
//                
//                print("text = \(country.countryName)")
//                
//                self.countryButton.setTitle(country.dialCode, for: .normal)
//
//            }
//
//        }
        
    }
    

}
