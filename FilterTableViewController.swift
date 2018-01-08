//
//  FilterTableViewController.swift
//  TwoWayCommunication
//
//  Created by Allie Shuldman 2016 on 3/2/16.
//  Copyright © 2016 Allie Shuldman. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {

    @IBOutlet var filterTableView: UITableView!
    var grades = [String]()
    var cellSelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterTableView.delegate = self
        filterTableView.dataSource = self
        
        grades = determineClassYears()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func determineClassYears() -> [String]
    {
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let dateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.month, NSCalendar.Unit.year], from: currentDate)
        let month = dateComponents.month
        let year = dateComponents.year
        
        var seniorClass : String = ""
        var juniorClass : String = ""
        var sophomoreClass : String = ""
        var freshmenClass : String = ""
        
        if(month! > 9 && month! < 12)
        {
            seniorClass = "\(year! + 1)"
            juniorClass = "\(year! + 2)"
            sophomoreClass = "\(year! + 3)"
            freshmenClass = "\(year! + 4)"
        }
        else
        {
            seniorClass = "\(year)"
            juniorClass = "\(year! + 1)"
            sophomoreClass = "\(year! + 2)"
            freshmenClass = "\(year! + 3)"
        }
        
        var arrayOfGrades = [String]()
        arrayOfGrades.append("FACSTAFF")
        arrayOfGrades.append(seniorClass)
        arrayOfGrades.append(juniorClass)
        arrayOfGrades.append(sophomoreClass)
        arrayOfGrades.append(freshmenClass)
        
        return arrayOfGrades
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = grades[indexPath.row]
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cellSelected = grades[indexPath.row]
        performSegue(withIdentifier: "filterBrowse", sender: self)
        print(cellSelected)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "filterBrowse"
        {
            let destination = segue.destination as! ViewController
            destination.browseURL = URL(string: "http://namesandfaces.hotchkiss.org/dbsamplequeryprogram.php?class=\(cellSelected)")
            destination.hasBeenFiltered = true
            destination.filterTitle = "\(cellSelected)"
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
