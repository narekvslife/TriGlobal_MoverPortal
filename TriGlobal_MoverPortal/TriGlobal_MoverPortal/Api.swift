//
//  Api.swift
//  TriGlobal_MoverPortal
//
//  Created by Nikolay Safonov on 07/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import Foundation

let headers = [
    "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
    "cache-control": "no-cache",
]
let parameters = [
    [
        "name": "token",
        "value": "CdcZ5TqsTS"
    ],
    [
        "name": "id",
        "value": "1"
    ]
]

let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"

var body = ""
var error: NSError? = nil
//for param in parameters {
//    let paramName = param["name"]!
//    if param != parameters[0]{
//        body += "\n--\(boundary)\r\n"
//    }
//    else{
//        body += "--\(boundary)\r\n"
//    }
//    body += "Content-Disposition: form-data; name=\"\(paramName)\""
//    if let paramValue = param["value"] {
//        body += "\r\n\r\(paramValue)"
//    }
//}
//body += "\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
//

let request = NSMutableURLRequest(url: NSURL(string: "https://public.triglobal.info/api/requests.php")! as URL,
                                  cachePolicy: .useProtocolCachePolicy,
                                  timeoutInterval: 10.0)
request.httpMethod = "POST"
request.allHTTPHeaderFields = headers

body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\nContent-Disposition: form-data; name=\"token\"\n\nCdcZ5TqsTS\n------WebKitFormBoundary7MA4YWxkTrZu0gW\nContent-Disposition: form-data; name=\"id\"\n\n1\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

request.httpBody = body.data(using: .utf8)

var dataa: JSONSerialization
let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if let error = error {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse!)
        if let data = data{
            do {
                
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [Dictionary<String,Any>]
                print(jsonData)
                
                
                
            } catch {
                print(error)
            }
            
        }
        
    }
})

dataTask.resume()



