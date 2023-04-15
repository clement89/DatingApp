//
//  CountrySelectionModel.swift
//  Affinitee
//
//  Created by Clement Joseph on 19/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Model

struct CountrySelectionModel : Equatable {
    
    let countryName     : String  // "Country name" #
    let isoCode         : String  // "ISO code" #
    let dialCode        : String  // "dial code" #
    let imageName       : String  // "Country image" #

    static func == (lhs: CountrySelectionModel, rhs: CountrySelectionModel) -> Bool {
        return lhs.countryName == rhs.countryName
    }
    
}
