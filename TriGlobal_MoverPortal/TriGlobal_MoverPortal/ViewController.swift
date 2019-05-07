//
//  ViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 07/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let leads: [Lead]? = Lead.leadsData(id: "1")
        print(leads!)
    }


}

