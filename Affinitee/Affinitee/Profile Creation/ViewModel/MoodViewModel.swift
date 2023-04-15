//
//  MoodViewModel.swift
//  Affinitee
//
//  Created by Clement Joseph on 06/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit

class MoodViewModel: NSObject {
    
    var isSearching: Bool
    var moodList: [MoodModel] = []

    
    init(searchig : Bool) {

        self.isSearching = searchig

    }
    
    func updateMoodList(){
        
        for i in 0..<6{
           
            if i == 0
            {
                let mood = MoodModel(moodType: Mood.romantic, moodName: NSLocalizedString("MOOD_ROMANTIC", comment: "Romantic mood"), moodImage: "mood_romantic")
                moodList.append(mood)
                
            }else  if i == 1
            {
                let mood = MoodModel(moodType: Mood.energetic, moodName: NSLocalizedString("MOOD_ENERGETIC", comment: "Energetic mood"), moodImage: "mood_energitic")
                moodList.append(mood)
                
            }else  if i == 2
            {
                let mood = MoodModel(moodType: Mood.bored, moodName: NSLocalizedString("MOOD_BORED", comment: "Bored mood"), moodImage: "mood_bored")
                moodList.append(mood)
                
            }else  if i == 3
            {
                let mood = MoodModel(moodType: Mood.lonely, moodName: NSLocalizedString("MOOD_LONELY", comment: "Lonely mood"), moodImage: "mood_lonely")
                moodList.append(mood)
                
            }else  if i == 4
            {
                let mood = MoodModel(moodType: Mood.depressed, moodName: NSLocalizedString("MOOD_DEPRESSED", comment: "Depressed mood"), moodImage: "mood_depressed")
                moodList.append(mood)
                
            }else  if (i == 5 && isSearching)
            {
                let mood = MoodModel(moodType: Mood.all, moodName: NSLocalizedString("MOOD_ALL", comment: "All mood"), moodImage: "mood_all")
                moodList.append(mood)
                
            }
            
            
        }
        
    }

}
