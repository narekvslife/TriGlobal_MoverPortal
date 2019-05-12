//
//  LeadsViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

class LeadsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let leads: [Lead]? = Lead.getLeadsData(id: "1")
        print(leads!)
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
