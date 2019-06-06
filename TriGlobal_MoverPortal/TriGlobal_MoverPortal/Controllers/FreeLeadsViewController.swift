//
//  FreeLeadsViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

struct TableStruct{
    var isOpened = false
    var cellPreview: LeadPreview
    var cellAdditional: LeadAdditional
}

struct LeadPreview {
    var movingFrom = "-"
    var movingTo = "-"
    var timeLeft = "?"
}

struct LeadAdditional {
    var movingSize = "-"
    var movingDate = "-"
    var Price = "??"
}

class FreeLeadsViewController: UITableViewController {

    var api: ApiLead?
    
    var tableArray = [TableStruct(isOpened: false, cellPreview: LeadPreview(), cellAdditional: LeadAdditional()),
                      TableStruct(isOpened: false, cellPreview: LeadPreview(), cellAdditional: LeadAdditional()),
                      TableStruct(isOpened: false, cellPreview: LeadPreview(), cellAdditional: LeadAdditional()),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /*
        DispatchQueue.global(qos: .userInteractive).async {
            self.api = ApiLead(id: "1", apiType: .FreeLeads)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }*/
        
        tableView.dataSource = self
        
        tableView.rowHeight = 70
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableArray.count
        //return api?.leads?.count ?? 0 + 1// +1 as we have the 'Title' thing even when we open a line
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO
        if self.tableArray[section].isOpened
        {
            //return tableArray[section].cellTitle.count + 1
            return 2
        }else{
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "FreeLeadCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let myCell = cell as? FreeLeadsTableViewCell {
            // TODO
        }
        return cell*/
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FreeLeadPreviewCell") as? FreeLeadsPreviewTableViewCell else {return UITableViewCell()}
            //cell.textLabel?.text = self.tableArray[indexPath.section].sectionTitle
            cell.fromLabel?.text = self.tableArray[indexPath.section].cellPreview.movingFrom
            cell.toLabel?.text = self.tableArray[indexPath.section].cellPreview.movingTo
            cell.timeLeftLabel?.text = self.tableArray[indexPath.section].cellPreview.timeLeft
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FreeLeadAdditionalCell") as? FreeLeadsAdditionalInfoTableViewCell else {return UITableViewCell()}
            //cell.textLabel?.text = self.tableArray[indexPath.section].cellTitle[indexPath.row - 1]
            cell.movingSizeLabel?.text = self.tableArray[indexPath.section].cellAdditional.movingSize
            cell.movingDateLabel?.text = self.tableArray[indexPath.section].cellAdditional.movingDate
            cell.priceLabel?.text = self.tableArray[indexPath.section].cellAdditional.Price
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.tableArray[indexPath.section].isOpened{
            self.tableArray[indexPath.section].isOpened = false
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }
        else{
            self.tableArray[indexPath.section].isOpened = true
            let section = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(section, with: .none)
        }
    }
}
