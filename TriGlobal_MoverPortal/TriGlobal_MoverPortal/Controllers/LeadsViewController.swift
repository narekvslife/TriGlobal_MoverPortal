//
//  LeadsViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

class LeadsViewController: UITableViewController {
    
    var api: ApiLead?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global(qos: .userInteractive).async {
            self.api = ApiLead(id: "1")
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        tableView.dataSource = self
        
        
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return api?.leads?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeadCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let myCell = cell as? LeadsTableViewCell {
            let lead = api!.leads![indexPath.row]
            myCell.FullName.text = lead.name
            myCell.DeadLineDate.text = dateFormatter.string(from: lead.movingDate)
        }
       return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let id = segue.identifier{
            switch id {
            case "ShowDetailsSeague":
                if let cell = sender as? LeadsTableViewCell,
                    let indexPath = tableView.indexPath(for: cell),
                    let sequedTo = segue.destination as? DetailedLeadViewController{
                    // TODO 55:56
                }
                
            default: break
                
            }
        }
    }
    
}
