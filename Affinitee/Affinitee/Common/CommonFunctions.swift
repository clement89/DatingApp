//
//  CommonFunctions.swift
//  Affinitee
//
//  Created by Clement Joseph on 15/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import Foundation



class CommonFunctions: NSObject {
    
    
    enum AppStoryboard : String {
        case Main, SignUp , ProfileCreation
        var instance : UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
        }
    }

}

public func Log<T>(_ object: T?, filename: String = #file, line: Int = #line, funcname: String = #function) {
    #if DEBUG
    guard let object = object else { return }
    print("***** \(Date()) \(filename.components(separatedBy: "/").last ?? "") (line: \(line)) :: \(funcname) :: \(object)")
    #endif
}
