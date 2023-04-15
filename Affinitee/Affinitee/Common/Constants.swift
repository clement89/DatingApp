//
//  Constants.swift
//  Affinitee
//
//  Created by Clement Joseph on 16/06/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import Foundation
import UIKit  //For -- CGFloat




struct FontType {
    
    static let medium         : String = "ProximaNovaW07-Medium"
    static let bold           : String = "ProximaNovaW08-Bold"
    static let regular        : String = "ProximaNovaW08-Regular"
    static let semibold       : String = "ProximaNovaW08-Semibold"
}

struct FontSize {
    
    static let welcomTitle        : CGFloat = DeviceType.IS_IPHONE_5_OR_LESS ? 33 :48

    static let heading            : CGFloat = 40
    static let buttonTitle        : CGFloat = DeviceType.IS_IPHONE_5_OR_LESS ? 16 :18
    static let subTitle           : CGFloat = DeviceType.IS_IPHONE_5_OR_LESS ? 14 :16
    static let cellTitle          : CGFloat = DeviceType.IS_IPHONE_5_OR_LESS ? 16 :18
    static let alertTitle         : CGFloat = 20

    static let textField         : CGFloat = DeviceType.IS_IPHONE_5_OR_LESS ? 18 :22

    
}


struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
struct DeviceType
{
    static let IS_IPHONE_5_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 667.0
}



struct Color {

    static let themeColor: UIColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 178/255.0, alpha: 1.0)

}



struct UserKeys {
    
    static let basicInfo         : String = "user_basic_info"
    static let detailedInfo      : String = "user_detailed_info"
    static let habitInfo         : String = "user_habit_info"
    static let travelInfo        : String = "user_travel_info"
    static let notifInfo         : String = "user_notification_info"

    
    static let name                       : String = "username"
    static let dob                        : String = "user_dob"
    static let mood                       : String = "user_mood"
    static let thumbnailUrl               : String = "user_thumbnail_url"
    static let job                        : String = "user_job"
    static let company                    : String = "user_company"
    static let relationshipStatus         : String = "user_relationship_status"



}


struct FireBaseTable {

    static let allUserInfo         : String = "all_user_table"
    static let locationInfo        : String = "all_user_location_table"

}


struct AppConstants {
    static let isProfileCompleted         : String = "is_profile_completed"
}

struct Mood {
    
    static let all            : String = "all_mood"
    static let lonely         : String = "lonely_mood"
    static let romantic       : String = "romantic_mood"
    static let energetic      : String = "energetic_mood"
    static let bored          : String = "bored_mood"
    static let depressed      : String = "depressed_mood"

}

struct Habit {
    
    static let reading     : String = "user_reading_habit"
    static let gym         : String = "user_workout_habit"
    static let cooking     : String = "user_cooking_habit"
    static let party       : String = "user_party_habit"
    static let travel      : String = "user_tavel_habit"
    static let smoking     : String = "user_smoking_habit"
    static let drinking    : String = "user_drinking_habit"
    static let weed        : String = "user_drug_habit"

}
