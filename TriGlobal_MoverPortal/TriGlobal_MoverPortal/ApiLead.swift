//
//  ApiLead.swift
//  TriGlobal_MoverPortal
//
//  Created by Nikolay Safonov on 07/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import Foundation

struct ApiLead {
    
    var leadsJson: [Dictionary<String,Any>]?
    
    private static func leadsRequest(id: String) -> [Dictionary<String,Any>]?{
        var json: [Dictionary<String,Any>]? {
            didSet{
                if json != nil{
                    
                }
            }
        }
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
                } else {
                    if let data = data{
                        do {
                            if let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,String>]{
                                json = jsonData
                                group.leave()
                            }
                            
                        } catch { print(error) }
                        
                    }
                    
                }
            }.resume()
            
        }
        
        group.wait()
    
        return json
    }
    
    init(id: String){
        self.leadsJson = ApiLead.leadsRequest(id: id)
    }
    
    
}
