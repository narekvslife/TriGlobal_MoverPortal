//
//  DetailedLeadViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

class DetailedLeadViewController: UITableViewController {

    
    //  TODO 55 56
    public var leadInfo: Lead? =  nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(leadInfo)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 5
        case 2, 3:
            return 4
        default:
            return 0
        }
    }
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
     
        case 1:
     
        case 2:
     
        case 3:
     
        default:
            
        }
    }
    */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailedCell", for: indexPath)
        
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = "hey"
        case 1:
            cell.textLabel?.text = "bitch"
        case 2:
            cell.textLabel?.text = "bye"
        case 3:
            cell.textLabel?.text = "horse"
        default:
            cell.textLabel?.text = ""
        }
        
        return cell
    }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

