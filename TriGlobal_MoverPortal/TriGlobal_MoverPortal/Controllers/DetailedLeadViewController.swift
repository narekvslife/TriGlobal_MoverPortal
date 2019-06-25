//
//  DetailedLeadViewController.swift
//  TriGlobal_MoverPortal
//
//  Created by narekvslife on 12/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import UIKit
import MessageUI

class DetailedLeadViewController: UITableViewController {

    public var leadInfo: Lead? =  nil
    
    
    @IBOutlet weak var movingDateLabel: UILabel!
    @IBOutlet weak var volumeM3Label: UILabel!
    @IBOutlet weak var volumeFt3Label: UILabel!
    @IBOutlet weak var assemblyLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phone1Label: UILabel!
    @IBOutlet weak var phone2Label: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var movingFromStreetLabel: UILabel!
    @IBOutlet weak var movingFromZipcodeLabel: UILabel!
    @IBOutlet weak var movingFromCityLabel: UILabel!
    @IBOutlet weak var movingFromCountryLabel: UILabel!
    @IBOutlet weak var movingToStreetLabel: UILabel!
    @IBOutlet weak var movingToZipcodeLabel: UILabel!
    @IBOutlet weak var movingToCityLabel: UILabel!
    @IBOutlet weak var movingToCountryLabel: UILabel!
    @IBOutlet weak var leadAddedDateLabel: UILabel!
    @IBOutlet weak var packingLabel: UILabel!
    @IBOutlet weak var businessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        movingDateLabel.text = df.string(from: leadInfo!.movingDate)
        volumeM3Label.text = leadInfo?.volumeM
        volumeFt3Label.text = leadInfo?.volumeFt
        assemblyLabel.text = (leadInfo?.assembly == "2") ? "Yes" :
            (leadInfo?.assembly == "1") ? "No" : ""
        storageLabel.text = (leadInfo?.storage == "2") ? "Yes" :
            (leadInfo?.storage == "1") ? "No" : ""
        
        packingLabel.text = (leadInfo?.packing == "2") ? "Yes" :
            (leadInfo?.packing == "1") ? "No" : ""
        
        businessLabel.text = (leadInfo?.business ==
            true) ? "Yes" : "No"
            
        
        companyNameLabel.text = leadInfo?.companyName
        nameLabel.text = leadInfo?.name
        phone1Label.text = leadInfo?.telephoneFirst
        phone2Label.text = leadInfo?.telephoneSecond
        emailLabel.text = leadInfo?.email
        
        movingFromStreetLabel.text = leadInfo?.streetFrom
        movingFromZipcodeLabel.text = leadInfo?.zipcodeFrom
        movingFromCityLabel.text = leadInfo?.cityFrom
        movingFromCountryLabel.text = leadInfo?.countryFrom
        
        movingToStreetLabel.text = leadInfo?.streetTo
        movingToZipcodeLabel.text = leadInfo?.zipcodeTo
        movingToCityLabel.text = leadInfo?.cityTo
        movingToCountryLabel.text = leadInfo?.countryTo
        leadAddedDateLabel.text = leadInfo?.received
    }
    
    
    @IBAction func CallNumberFirst(_ sender: Any) {
        if let phone = phone1Label.text{
            let url: NSURL = NSURL(string: "tel://\(phone.replacingOccurrences(of: " ", with: ""))")!
            UIApplication.shared.open(url as URL)
        }
        
    }
    
    
    @IBAction func CallNumberSecond(_ sender: Any) {
        if let phone = phone2Label.text{
            let url: NSURL = NSURL(string: "tel://\(phone.replacingOccurrences(of: " ", with: ""))")!
            UIApplication.shared.open(url as URL)
        }
    }
    
    @IBAction func SendEmail(_ sender: Any) {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["\(emailLabel.text!)"])
        present(composer, animated: true)
    }
    
    /*
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
     */
}
extension DetailedLeadViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed to send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        }
        
        controller.dismiss(animated: true)
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
