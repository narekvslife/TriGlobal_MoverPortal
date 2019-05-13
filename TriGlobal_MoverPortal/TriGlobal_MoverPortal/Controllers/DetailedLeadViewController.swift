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
    private var leadInfo: Lead? =  nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //method for drawing headers
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let  headerCell = tableView.dequeueReusableCell(withIdentifier :"DetailedHeaderCell")
            
            if let myHeaderCell = headerCell as? DetailedTableViewHeaderCell
        {
        switch (section) {
            case 0:
                myHeaderCell.headerName.text = "General Information";
            case 1:
                myHeaderCell.headerName.text = "Contact Details";
            case 2:
                myHeaderCell.headerName.text = "Moving From";
            case 3:
                myHeaderCell.headerName.text = "Moving To";
            default: break
            }
        }
        return headerCell
        
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
