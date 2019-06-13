//
//  ApiFreeLead.swift
//  TriGlobal_MoverPortal
//
//  Created by Nikolay Safonov on 13/06/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import Foundation

let freeLeadsURL = "https://public.triglobal-test-back.nl/api/freeleads.php"

struct ApiFreeLead {
    
    var freeLeadsJson: Dictionary<String,Any>?
    var freeLeads: [FreeLead]?
    
    private static func freeLeadsRequest(id: String, url: String) -> Dictionary<String,Any>?{
        var json: Dictionary<String,Any>?
        
        let headers = [
            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "cache-control": "no-cache",
        ]
        
        let body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\nContent-Disposition: form-data; name=\"token\"\n\nCdcZ5TqsTS\n------WebKitFormBoundary7MA4YWxkTrZu0gW\nContent-Disposition: form-data; name=\"id\"\n\n\(id)\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
        
        
        let group = DispatchGroup()
        group.enter()
        
        
        DispatchQueue.global().async {
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
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
                            if let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
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
    
    
    
    init(id: String){
        self.freeLeadsJson = ApiFreeLead.freeLeadsRequest(id: id, url: freeLeadsURL)
        if let json = self.freeLeadsJson{
            freeLeads = ApiFreeLead.fromJsonToFreeLeadsArray(json: json)
        }
        
    }
    
    static func fromJsonToFreeLeadsArray(json: Dictionary<String,Any>?) -> [FreeLead]?{
        var freeLeads_ = [FreeLead]()
        for obj in json!{
            let dict = obj.value as? NSDictionary
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let time = String(describing: dict!["time_left"]!)
            let timeArray = time.split(separator: ":")
            let hours = Int(timeArray[0])
            let mins = Int(timeArray[1])
            
            let newFreeLead = FreeLead(id: String(describing: dict!["re_id"] ?? "-"), timeLeft: time , price: String(describing: dict!["credit_amount"] ?? "-"),
                matched: String(describing: dict!["amount_matched"] ?? "-"),
                timeRaw: hours! * 60 + mins!)
            
            freeLeads_.append(newFreeLead)
        }
        freeLeads_ = freeLeads_.sorted(by: { $0.timeRaw < $1.timeRaw})
        
        return freeLeads_
    }
    
    
}

