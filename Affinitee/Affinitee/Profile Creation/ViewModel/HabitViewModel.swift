//
//  HabitViewModel.swift
//  Affinitee
//
//  Created by Clement Joseph on 06/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit

class HabitViewModel: NSObject {
    
    
    
    
    func getHabitTitles(type: String) -> [String] {
        
        switch type {
        case Habit.drinking:
           
           return [NSLocalizedString("DRINKING_HABIT_LEVEL_0", comment: "Drinking habit low value"),
                             NSLocalizedString("DRINKING_HABIT_LEVEL_1", comment: "Drinking habit 1"),
                             NSLocalizedString("DRINKING_HABIT_LEVEL_2", comment: "Drinking habit 2"),
                             NSLocalizedString("DRINKING_HABIT_LEVEL_3", comment: "Drinking habit 3"),
                             NSLocalizedString("DRINKING_HABIT_LEVEL_4", comment: "Drinking habit heigh value")
            ]
            
        case Habit.smoking:
           
            
            return [NSLocalizedString("SMOKING_HABIT_LEVEL_0", comment: "Smoking habit low value"),
                            NSLocalizedString("SMOKING_HABIT_LEVEL_1", comment: "Smoking habit 1"),
                            NSLocalizedString("SMOKING_HABIT_LEVEL_2", comment: "Smoking habit 2"),
                            NSLocalizedString("SMOKING_HABIT_LEVEL_3", comment: "Smoking habit 3"),
                            NSLocalizedString("SMOKING_HABIT_LEVEL_4", comment: "Smoking habit heigh value")
            ]
            
        case Habit.gym:
   
            
            return [NSLocalizedString("WORKOUT_HABIT_LEVEL_0", comment: "Workout habit low value"),
                            NSLocalizedString("WORKOUT_HABIT_LEVEL_1", comment: "Workout habit 1"),
                            NSLocalizedString("WORKOUT_HABIT_LEVEL_2", comment: "Workout habit 2"),
                            NSLocalizedString("WORKOUT_HABIT_LEVEL_3", comment: "Workout habit 3"),
                            NSLocalizedString("WORKOUT_HABIT_LEVEL_4", comment: "Workout habit heigh value")
            ]
        case Habit.party:
         
            
            return [NSLocalizedString("PARTY_HABIT_LEVEL_0", comment: "Party habit low value"),
                            NSLocalizedString("PARTY_HABIT_LEVEL_1", comment: "Party habit 1"),
                            NSLocalizedString("PARTY_HABIT_LEVEL_2", comment: "Party habit 2"),
                            NSLocalizedString("PARTY_HABIT_LEVEL_3", comment: "Party habit 3"),
                            NSLocalizedString("PARTY_HABIT_LEVEL_4", comment: "Party habit heigh value")
            ]
            
        case Habit.cooking:
            
            
            return [NSLocalizedString("COOKING_HABIT_LEVEL_0", comment: "Cooking habit low value"),
                            NSLocalizedString("COOKING_HABIT_LEVEL_1", comment: "Cooking habit 1"),
                            NSLocalizedString("COOKING_HABIT_LEVEL_2", comment: "Cooking habit 2"),
                            NSLocalizedString("COOKING_HABIT_LEVEL_3", comment: "Cooking habit 3"),
                            NSLocalizedString("COOKING_HABIT_LEVEL_4", comment: "Cooking habit heigh value")
            ]
            
        case Habit.travel:
            
            
            return [NSLocalizedString("TRAVEL_HABIT_LEVEL_0", comment: "Travel habit low value"),
                            NSLocalizedString("TRAVEL_HABIT_LEVEL_1", comment: "Travel habit 1"),
                            NSLocalizedString("TRAVEL_HABIT_LEVEL_2", comment: "Travel habit 2"),
                            NSLocalizedString("TRAVEL_HABIT_LEVEL_3", comment: "Travel habit 3"),
                            NSLocalizedString("TRAVEL_HABIT_LEVEL_4", comment: "Travel habit heigh value")
            ]
            
        case Habit.reading:
            
            
            return [NSLocalizedString("READING_HABIT_LEVEL_0", comment: "Reading habit low value"),
                            NSLocalizedString("READING_HABIT_LEVEL_1", comment: "Reading habit 1"),
                            NSLocalizedString("READING_HABIT_LEVEL_2", comment: "Reading habit 2"),
                            NSLocalizedString("READING_HABIT_LEVEL_3", comment: "Reading habit 3"),
                            NSLocalizedString("READING_HABIT_LEVEL_4", comment: "Reading habit heigh value")
            ]
            
        case Habit.weed:
          
            
            return [NSLocalizedString("MARIJUANA_HABIT_LEVEL_0", comment: "Marijuana habit low value"),
                            NSLocalizedString("MARIJUANA_HABIT_LEVEL_1", comment: "Marijuana habit 1"),
                            NSLocalizedString("MARIJUANA_HABIT_LEVEL_2", comment: "Marijuana habit 2"),
                            NSLocalizedString("MARIJUANA_HABIT_LEVEL_3", comment: "Marijuana habit 3"),
                            NSLocalizedString("MARIJUANA_HABIT_LEVEL_4", comment: "Marijuana habit heigh value")
            ]
            
        default:
            return ["","","","",""]
        }
        
    
    }

    
    
    
    func getHabitInfo(type: String) -> (heading: String, titles: [String], image: String) {
        
        
        var titleStrings: [String]
        var heading: String
        var imageName: String
        
        titleStrings = getHabitTitles(type: type)

        
        switch type {
            case Habit.drinking:
                heading = NSLocalizedString("DRINK_HABIT", comment: "Liquor")
                imageName = "habit_drinking"
            
            case Habit.smoking:
                heading = NSLocalizedString("SMOKING_HABIT", comment: "Smoking")
                imageName = "habit_smoking"
            
            case Habit.gym:
                heading = NSLocalizedString("GYM_HABIT", comment: "Workout")
                imageName = "habit_workout"
            
            
            case Habit.party:
                heading = NSLocalizedString("PARTY_HABIT", comment: "Party")
                imageName = "habit_party"
            
            case Habit.cooking:
                heading =  NSLocalizedString("COOKING_HABIT", comment: "Cooking")
                imageName = "habit_cooking"
            
            case Habit.travel:
                heading =  NSLocalizedString("TRAVEL_HABIT", comment: "Travel")
                imageName = "habit_travel"
            
            case Habit.reading:
                heading =  NSLocalizedString("READING_HABIT", comment: "Reading")
                imageName = "habit_reading"
            
            case Habit.weed:
                heading =  NSLocalizedString("WEED_HABIT", comment: "Weed")
                imageName = "habit_weed"            
            default:
                heading = ""
                imageName = ""

        }
        
        
        return (heading, titleStrings, imageName)
        
        
    }
    
    
    

    func getUserHabitList(habitDict: [String: Any]) -> [HabitModel] {
        
        var habitList: [HabitModel] = []

        for (habitType, HabitValue) in habitDict {
            
            let value :Float = HabitValue as! Float
            var title :String = ""
            
            let eachHabitInfo = getHabitInfo(type: habitType)
            
            if (value == 0) {
                title = eachHabitInfo.titles[0]
            } else if (value > 0 && value < 2.5) {
                
                title = eachHabitInfo.titles[1]
            }else if (value > 2.5 && value < 5) {
                
                title = eachHabitInfo.titles[2]
            }else if (value > 5 && value < 7.5) {
                
                title = eachHabitInfo.titles[3]
            }else if (value > 7.5) {
                
                title = eachHabitInfo.titles[4]
            }
            

            let habit = HabitModel(habitType: habitType, habitHeading: eachHabitInfo.heading, habitTitle: title, HabitImage: eachHabitInfo.image, HabitValue: HabitValue as! Float)
            habitList.append(habit)
            
        }


        return habitList
    }
    
    
    
    
    func getMyHabitList(habitDict: [String: Any]) -> [HabitModel] {
        
        var habitList: [HabitModel] = []
        
        for (habitType, HabitValue) in habitDict {
            
            let value :Float = HabitValue as! Float
            var title :String = ""
            
            let eachHabitInfo = getHabitInfo(type: habitType)
            
            if (value == 0) {
                title = eachHabitInfo.titles[0]
            } else if (value > 0 && value < 2.5) {
                
                title = eachHabitInfo.titles[1]
            }else if (value > 2.5 && value < 5) {
                
                title = eachHabitInfo.titles[2]
            }else if (value > 5 && value < 7.5) {
                
                title = eachHabitInfo.titles[3]
            }else if (value > 7.5) {
                
                title = eachHabitInfo.titles[4]
            }
            
            
            let habit = HabitModel(habitType: habitType, habitHeading: eachHabitInfo.heading, habitTitle: title, HabitImage: eachHabitInfo.image, HabitValue: HabitValue as! Float)
            habitList.append(habit)
            
        }
        
        
        return habitList
    }
    
    
    func getAllHabitList() -> [HabitModel] {
        
        var allHabitList: [HabitModel] = []

        
        let habitList: [String] = [Habit.drinking, Habit.smoking, Habit.weed, Habit.party, Habit.gym, Habit.travel, Habit.cooking, Habit.reading]
        
        var myHabitInfo: [String: Any]? = UserDefaults.standard.object(forKey: UserKeys.habitInfo) as? Dictionary<String,Any>
        
        for habitType in habitList {
        
            
            let value :Float = myHabitInfo?[habitType] as? Float ?? 0
            
            Log(value)
            
            var title :String = ""
            
            let eachHabitInfo = getHabitInfo(type: habitType)
            
            if (value == 0) {
                title = eachHabitInfo.titles[0]
            } else if (value > 0 && value < 2.5) {
                
                title = eachHabitInfo.titles[1]
            }else if (value > 2.5 && value < 5) {
                
                title = eachHabitInfo.titles[2]
            }else if (value > 5 && value < 7.5) {
                
                title = eachHabitInfo.titles[3]
            }else if (value > 7.5) {
                
                title = eachHabitInfo.titles[4]
            }
            
            let habit = HabitModel(habitType: habitType, habitHeading: eachHabitInfo.heading, habitTitle: title, HabitImage: eachHabitInfo.image, HabitValue: value)
            allHabitList.append(habit)

        }
        
        
        return allHabitList
    }
    
    
    
//    func getAllHabits() -> [HabitModel] {
//
//    }

    
    
    
}
