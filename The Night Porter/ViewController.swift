//
//  ViewController.swift
//  The Night Porter
//
//  Created by Jeffrey Van Horn on 10/4/18.
//  Copyright © 2018 Jeffrey Van Horn. All rights reserved.
//

//allows us access to everything in UI code we need
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //table view delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    
    //table view data source methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        let cell = UITableViewCell();
        
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row]
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
        default:
            cell.textLabel?.text = "This should not happen"
        }
        return cell;
    }
    
    //data for the table view
    let dailyTasks = ["Check all windows",
                      "Check all doors",
                      "Is the boiler fueled",
                      "Check the mailbox",
                      "Empty trash containers",
                      "If freezing, check water pipes",
                      "Document \"strange and unusual\" occurences"]
    
    let weeklyTasks = ["Check inside all cabins",
                       "Flush all lavartories",
                       "Walk the perimeter of property"]
    
    let monthlyTasks = ["Test security alarm",
                        "Test motion detectors",
                        "Test smoke alarms"]
    

    @IBAction func changeBackground(_ sender: Any) {
        //refering to a the top view in the hierarchy
        view.backgroundColor = UIColor.darkGray
        
        //TODO: change the test color of every label
        
        //get all the subviews for view
        let everything = view.subviews
        
        for eachView in everything{
            //need to cast subview odbjects into labels
            if eachView is UILabel{
                //downcast as UILabel
                let currentLabel = eachView as! UILabel
                currentLabel.textColor = UIColor.lightGray
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

