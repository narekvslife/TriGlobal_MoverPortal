//
//  ApiLead.swift
//  TriGlobal_MoverPortal
//
//  Created by Nikolay Safonov on 07/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import Foundation


let leadsURL = "https://public.triglobal.info/api/requests.php"
let freeLeadsURL = "https://public.triglobal.info/api/freeleads.php"


struct ApiLead {
    
    var leadsJson: [Dictionary<String,Any>]?
    var freeLeadsJson: [Dictionary<String,Any>]?
    var leads: [Lead]?
    var freeLeads : [Lead]?
    
    
    
    private static func leadsRequest(id: String, url: String) -> [Dictionary<String,Any>]?{
        var json: [Dictionary<String,Any>]?
  
        let headers = [
            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "cache-control": "no-cache",
        ]
        
        let body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\nContent-Disposition: form-data; name=\"token\"\n\nCdcZ5TqsTS\n------WebKitFormBoundary7MA4YWxkTrZu0gW\nContent-Disposition: form-data; name=\"id\"\n\n\(id)\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
        
        
        let group = DispatchGroup()
        group.enter()
        

        DispatchQueue.global().async {
            let request = NSMutableURLRequest(url: NSURL(string: "https://public.triglobal.info/api/requests.php")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = body.data(using: .utf8)
            
            URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                if let error = error {
                    print(error)
                    group.leave()
                } else {
                    if let data = data{
                        do {
                            if let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,String>]{
                                json = jsonData
                                group.leave()
                            }
                            
                        } catch { print(error)
                            group.leave()
                        }
                        
                    }
                    
                }
            }.resume()
            
        }
        
        group.wait()
        return json
    }
    
    enum type{
        case Leads
        case FreeLeads
    }
    
    init(id: String, apiType: type){
        
        switch apiType {
        case .Leads:
            self.leadsJson = ApiLead.leadsRequest(id: id, url: leadsURL)
            if let json = self.leadsJson{
                leads = ApiLead.fromJsonToLeadsArray(json: json)
            }
        case .FreeLeads:
            self.freeLeadsJson = ApiLead.leadsRequest(id: id, url: freeLeadsURL)
            if let json = self.freeLeadsJson{
                freeLeads = ApiLead.fromJsonToLeadsArray(json: json)
            }
        }

    }
    
    static func fromJsonToLeadsArray(json: [Dictionary<String,Any>]?) -> [Lead]?{
        var leads_ = [Lead]()
        for obj in json!{
            let lead = obj as! [String:String]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let newLead = Lead(id: lead["re_id"] ?? "-", received: lead["ktrecupo_timestamp"] ?? "-", name: lead["re_full_name"] ?? "-", email: lead["re_email"] ?? "-" , movingDate: dateFormatter.date(from: lead["re_moving_date"]!)!, cityFrom: lead["re_city_from"] ?? "-", countryFrom: lead["re_co_code_from"] ?? "-", cityTo: lead["re_city_to"] ?? "-", countryTo: lead["re_co_code_to"] ?? "-" , telephoneFirst: lead["re_telephone1"] ?? "-", telephoneSecond: lead["re_telephone2"] ?? "-", streetFrom: lead["re_street_from"] ?? "-", streetTo: lead["re_street_to"] ?? "-" , companyName: lead["re_company_name"] ?? "-", zipcodeFrom: lead["re_zipcode_from"] ?? "-", zipcodeTo: lead["re_zipcode_to"] ?? "-", remarks: lead["re_remarks"] ?? "-", volumeFt: lead["re_volume_ft3"] ?? "-", volumeM: lead["re_volume_m3"] ?? "-", business: lead["re_business"]!.bool!, storage: lead["re_storage"] ?? "-", packing: lead["re_packing"] ?? "-", assembly: lead["re_assembly"] ?? "-")
            leads_.append(newLead)
        }
        leads_ = leads_.sorted(by: { $0.movingDate < $1.movingDate})
        
        return leads_
    }
    
}

extension String {
    var bool: Bool? {
        switch self.lowercased() {
        case "true", "t", "yes", "y", "1":
            return true
        case "false", "f", "no", "n", "0", nil:
            return false
        default:
            return nil
        }
    }
}
