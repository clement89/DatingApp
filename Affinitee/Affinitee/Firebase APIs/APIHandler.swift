//
//  APIHandler.swift
//  Affinitee
//
//  Created by Clement Joseph on 26/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase



class APIHandler
{
    
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    typealias CompletionHandler = (_ result: String?, _ error: Error?) -> Void
    
    
    func signupWithEmai(email: String, password: String, completionHandler:  @escaping CompletionHandler) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // ...
            completionHandler(authResult?.user.uid, error)
        }

    }
    
    func loginWithEmai(email: String, password: String, completionHandler:  @escaping CompletionHandler) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completionHandler(authResult?.user.uid, error)
            // ...
        }
        
    }
    
    
    func loginWithPhone(phoneNumber: String,completionHandler:  @escaping CompletionHandler) {
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            completionHandler(verificationID, error)
            
        }
        
    }
    
    func signInWithCredentials(verificationID: String, verificationCode: String, completionHandler:  @escaping CompletionHandler) {
        
       
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode)

        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in

            completionHandler(authResult?.user.uid, error)

        }
        
    }
    
    
    
    func getUserInfo(userId: String, completionHandler: @escaping (_ result: NSDictionary?, _ error: String?) -> Void){
        //.. Code process

        ref.child(FireBaseTable.allUserInfo).child(userId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            completionHandler(value, nil) // return data & close

            // ...
        }) { (error) in
            print(error.localizedDescription)
            
            completionHandler(nil, error.localizedDescription) // return data & close

        }

    }
   
    


}

