//
//  HabitViewController.swift
//  Affinitee
//
//  Created by Clement Joseph on 10/07/19.
//  Copyright © 2019 Affinitee Limited. All rights reserved.
//

import UIKit
import LGButton


class HabitViewController: UITableViewController {
    
    var viewModel = HabitViewModel()
    var habitList: [HabitModel] = []
    
    var selectedRow :Int = -1
    var previousRow :Int = -1

    @IBOutlet weak var doneButton: LGButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        habitList = viewModel.getAllHabitList()
        
        createHeader()
      
        
        doneButton.titleFontName = FontType.semibold
        doneButton.titleFontSize = FontSize.buttonTitle
        doneButton.titleString = NSLocalizedString("DONE_BUTTON_TITLE", comment: "Done button title")
        doneButton.loadingString = NSLocalizedString("DONE_BUTTON_TITLE", comment: "Done button title")
        doneButton.loadingFontName = FontType.semibold
        doneButton.loadingFontSize = FontSize.buttonTitle

        
        //........
        
       
        
        
    }
    
    
    func createHeader() -> Void {
        
        let headeView = UIView(frame: CGRect(x: 0 , y: 0, width: UIScreen.main.bounds.width, height: 150))
        headeView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel(frame: CGRect(x: 30, y: 0, width: headeView.frame.size.width - 60 , height: 130))
        titleLabel.text = NSLocalizedString("HABIT_UPDATE_VIEW_TITLE", comment: "Habit update view title")
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name:FontType.bold , size: FontSize.heading)
        headeView.addSubview(titleLabel)
        
        self.tableView.tableHeaderView = headeView;
    }
    

    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == selectedRow
        {
            return 140
        }
        return 70.0
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        // Configure the cell...
        
        if(indexPath.row == selectedRow){
            
            let cell : HabitUpdateCell = tableView.dequeueReusableCell(withIdentifier: "habit_update_cell") as! HabitUpdateCell
            
            // #1 - The ViewModel is the app's de facto data source.
            
            let habit : HabitModel = habitList[indexPath.row]
            
            
            cell.habitImage.image = UIImage(named: habit.HabitImage)
            cell.title.text = habit.habitHeading
            
            cell.titlesArray = viewModel.getHabitTitles(type: habit.habitType)
            
            return cell
            
            
        }else{
            
            let cell : HabitCell = tableView.dequeueReusableCell(withIdentifier: "habit_cell") as! HabitCell
            
            // #1 - The ViewModel is the app's de facto data source.
            
            let habit : HabitModel = habitList[indexPath.row]
            
            
            cell.habitImage.image = UIImage(named: habit.HabitImage)
            cell.title.text = habit.habitHeading
            
            return cell
        }
        
        
    }
    


    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // MARK: - UITableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        previousRow = selectedRow
        selectedRow = indexPath.row
        
        var indexPaths : [IndexPath] = [indexPath]
        if(selectedRow != previousRow){
            
            let previousIndex = IndexPath(row: previousRow, section: 0)
            indexPaths.append(previousIndex)
        }
        
        tableView.reloadRows(at: indexPaths, with: .fade)

        
    }

    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
