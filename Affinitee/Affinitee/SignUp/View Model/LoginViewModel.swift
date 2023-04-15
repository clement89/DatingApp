//
//  LoginViewModel.swift
//  Affinitee
//
//  Created by Clement Joseph on 20/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import Foundation

class LoginViewModel
{
    
    var email: String?
    var password: String?
    
    let apiHandler = APIHandler()
    
    
    
    typealias CompletionHandler = (_ success:Bool , _ error: Error?) -> Void

    
    
    func loginUsingCredentials(email: String, password: String, completionHandler: @escaping CompletionHandler) {
       
        self.email = email
        self.password = password

        apiHandler.loginWithEmai(email: email, password: password) { (_ userId: String?, _ error: Error?) -> Void in
            
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
    
    
    func signupUsingCredentials(email: String, password: String, completionHandler: @escaping CompletionHandler) {
        
        
        self.email = email
        self.password = password
        
        apiHandler.signupWithEmai(email: email, password: password) { (_ userId: String?, _ error: Error?) -> Void in
            
            if((userId) != nil){
                completionHandler(true, nil)
            }else{
                completionHandler(false, error)
            }
           
        }
        
    }
    
    
    // MARK: - Private

   
    
    private func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
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
