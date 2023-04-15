//
//  MoodViewController.swift
//  Affinitee
//
//  Created by Clement Joseph on 06/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import PMSuperButton


class MoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var moodTable: UITableView!
    @IBOutlet weak var continueButton: PMSuperButton!
    
    var viewModel = MoodViewModel(searchig: false)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        viewModel.updateMoodList()

        
        titleLabel.text = NSLocalizedString("MOOD_UPDATE_VIEW_TITLE", comment: "mood selection view title")
        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        
       
        infoLabel.text = NSLocalizedString("MOOD_UPDATE_VIEW_SUBTITLE", comment: "mood selection view subtitle")
        infoLabel.font = UIFont(name:FontType.regular , size: FontSize.subTitle)
        
       
        
        moodTable.delegate = self
        moodTable.dataSource = self
        
        
    }
    
    
    // MARK: - UITableView Data Source
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moodList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : MoodCell = tableView.dequeueReusableCell(withIdentifier: "mood_cell") as! MoodCell
        
        // #1 - The ViewModel is the app's de facto data source.
        
        let mood : MoodModel = viewModel.moodList[indexPath.row]
        
        
        cell.moodLabel.text = mood.moodName
        cell.moodImage.image = UIImage(named: mood.moodImage)
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
       
        
        
        
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
