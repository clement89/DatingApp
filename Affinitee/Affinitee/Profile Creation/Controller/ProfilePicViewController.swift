//
//  ProfilePicViewController.swift
//  Affinitee
//
//  Created by Clement Joseph on 12/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import PMSuperButton
import YPImagePicker



class ProfilePicViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var picInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        titleLabel.text = NSLocalizedString("PROFILE_IMAGE_VIEW_TITLE", comment: "Profile image selection view title")
        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        
        
        infoLabel.text = NSLocalizedString("PROFILE_IMAGE_VIEW_SUBTITLE", comment: "Profile image selection view subtitle")
        infoLabel.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
        
        picInfoLabel.text = NSLocalizedString("PROFILE_IMAGE_VIEW_INFO", comment: "Profile image selection view info label")
        picInfoLabel.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
    }
    
    
    
    @IBAction func profilePicButtonClicked(_ sender: Any) {
        
        let picker = YPImagePicker()
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.profileImage.image = photo.image
            }
            

            picker.dismiss(animated: true, completion: nil)
        }
        present(picker, animated: true, completion: nil)
        
        
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
