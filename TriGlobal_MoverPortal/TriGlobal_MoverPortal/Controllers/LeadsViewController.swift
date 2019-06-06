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
    var refresher: UIRefreshControl!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: #selector(LeadsViewController.update),
                            for: UIControl.Event.valueChanged)
        tableView.addSubview(refresher)
        
        tableView.rowHeight = 60
    }
    
    @objc func update()
    {
        self.activityIndicator.center = self.view.center
        self.activityIndicator.hidesWhenStopped = true
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        DispatchQueue.global(qos: .userInteractive).async {
            self.api = ApiLead(id: "1", apiType: .Leads)
            DispatchQueue.main.async {
                if self.api?.leadsJson == nil{
                    let alert = UIAlertController(title: "Server Error", message: "Something went wrong", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default) {
                        (action) in  print("Error Api")
                    }
                    alert.addAction(ok)
                    
                    self.present(alert, animated: true, completion: nil)
                }
                self.refresher.endRefreshing()
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self

    }
    
    
    //var api: ApiLead?
    //var refresher: UIRefreshControl!
    //
    //override func viewDidLoad() {
    //    super.viewDidLoad()
    //    refresher = UIRefreshControl()
    //    //refresher.attributedTitle
    //
    //    refresher.addTarget(self, action: #selector(LeadsViewController.update), for: UIControl)
    //
    //    DispatchQueue.global(qos: .userInteractive).async {
    //        self.api = ApiLead(id: "1", apiType: .Leads)
    //
    //        DispatchQueue.main.async {
    //            self.tableView.reloadData()
    //        }
    //
    //    }
    //    tableView.dataSource = self
    //
    //    tableView.rowHeight = 60
    //}
    //
    //func update()
    //{
    //    DispatchQueue.global(qos: .userInteractive).async {
    //        self.api = ApiLead(id: "1", apiType: .Leads)
    //        DispatchQueue.main.async {
    //            self.tableView.reloadData()
    //        }
    //    }
    //    tableView.dataSource = self
    //}
    
    
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let id = segue.identifier{
            switch id {
            case "ShowDetailsSeague":
                if let cell = sender as? LeadsTableViewCell,
                    let indexPath = tableView.indexPath(for: cell),
                    let sequedTo = segue.destination as? DetailedLeadViewController{
                    sequedTo.leadInfo = api?.leads?[indexPath.row]
                }
                
            default: break
                
            }
        }
    }
    
}
