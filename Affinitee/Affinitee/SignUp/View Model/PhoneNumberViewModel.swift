//
//  PhoneNumberViewModel.swift
//  Affinitee
//
//  Created by Clement Joseph on 25/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import Foundation
import SwiftyJSON


class PhoneNumberViewModel
{

    let apiHandler = APIHandler()

    
    func getCurrentCuntry() -> CountrySelectionModel?{
        
        let locale = Locale.current

        let currentCuntryCode = locale.regionCode
        
        
        
        if let path = Bundle.main.path(forResource: "CountryCodes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let countryJSON = try JSON(data: data)
                
                for i in 0..<countryJSON.count{
                    
                    let isoCode = countryJSON[i]["code"]
                    
                    if(isoCode.stringValue == currentCuntryCode){
                        let dialCode = countryJSON[i]["dial_code"]
                        let name = countryJSON[i]["name"]
                        let image = "CountryPicker.bundle/\(isoCode.stringValue.lowercased()).ico"
                        let country = CountrySelectionModel(countryName: name.stringValue, isoCode: isoCode.stringValue, dialCode: dialCode.stringValue, imageName: image)
                        
                        return country
                    }
                   
                }
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        
       return nil
        
    }
    

    
    
    
    
    typealias CompletionHandler = (_ success:Bool , _ error: Error?) -> Void
    
    
    
    func loginUsingPhoneNumber(phone: String, completionHandler: @escaping CompletionHandler) {
        
        
        let digitChars  = phone.components(separatedBy:
            CharacterSet.decimalDigits.inverted).joined(separator: "")
        
        let phoneNum = "+" + digitChars
       
        Log(phoneNum)

        apiHandler.loginWithPhone(phoneNumber: phoneNum){ (_ verificationID: String?, _ error: Error?) -> Void in
            
            if((verificationID) != nil){
                
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                completionHandler(true, error)
                
            }else{
                completionHandler(false, error)
            }
        }
        
    }
        
        
    func signInWithVerificationCode(verificationCode: String, completionHandler: @escaping CompletionHandler) {
        
        
        
        let digitChars  = verificationCode.components(separatedBy:
            CharacterSet.decimalDigits.inverted).joined(separator: "")
        
        let verifiCode = "+" + digitChars
        
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
        
        
        apiHandler.signInWithCredentials(verificationID: verificationID, verificationCode: verifiCode) { (userId, error) in
            
            if((userId) != nil){
                
                self.apiHandler.getUserInfo(userId: userId!, completionHandler: { (userInfoDict, error) in
                    
                    if((userInfoDict) != nil){
                        UserDefaults.standard.set(true, forKey: AppConstants.isProfileCompleted) //Bool
                        self.saveUserInfo(info: userInfoDict as! [String : Any])
                    }else{
                        UserDefaults.standard.set(false, forKey: AppConstants.isProfileCompleted) //Bool
                    }
                    completionHandler(true, nil)
                    
                })
                
            }else{
                completionHandler(false, error)
            }
            
            
        }

        
        
        
    }
    
    private func saveUserInfo(info: [String : Any]) {
        
        if let basicInfo = info[UserKeys.basicInfo] as? [String : Any] {
            UserDefaults.standard.set(basicInfo, forKey: UserKeys.basicInfo)
        }
        
        if let basicInfo = info[UserKeys.detailedInfo] as? [String : Any] {
            UserDefaults.standard.set(basicInfo, forKey: UserKeys.detailedInfo)
        }
        
    }


}




extension String {
    var withoutSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.symbols).joined(separator: "")
    }
}
