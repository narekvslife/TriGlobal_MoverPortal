//
//  LeadsViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

class LeadsViewController: UITableViewController {

    private var leads: [Lead]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.leads = Lead.getLeadsData(id: "1")
        print(leads!)
    }
    
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return leads!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeadCell", for: indexPath)
        if let myCell = cell as? LeadsTableViewCell {
            let lead = self.leads![indexPath.row]
            myCell.FullName.text = lead.name
            myCell.DeadLineDate.text = lead.movingDate
        }
       return cell
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
