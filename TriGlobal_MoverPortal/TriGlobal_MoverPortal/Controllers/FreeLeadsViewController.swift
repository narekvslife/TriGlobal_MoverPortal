//
//  FreeLeadsViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

struct cellData{
    var opened = false
    // PreView
    var movingFrom :String
    var movingTo : String
    var movingDate : Date
    //FullInformation
}

class FreeLeadsViewController: UITableViewController {

    var api: ApiLead?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.api = ApiLead(id: "1", apiType: .FreeLeads)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        tableView.dataSource = self
        
        tableView.rowHeight = 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return api?.leads?.count ?? 0 + 1// +1 as we have the 'Title' thing even when we open a line
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FreeLeadCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let myCell = cell as? FreeLeadsTableViewCell {
            // TODO
        }
        return cell
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO
        return 0
    }
}
