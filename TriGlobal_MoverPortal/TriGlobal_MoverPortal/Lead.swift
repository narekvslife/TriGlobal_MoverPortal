//
//  Lead.swift
//  TriGlobal_MoverPortal
//
//  Created by Nikolay Shikunov on 07/05/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import Foundation

struct Lead {
    let id: String
    let received: String
    let name: String
    let email: String
    let movingDate: String
    let cityFrom: String
    let countryFrom: String // Api возвращает код страны, а не название страны. Нужно сопоставлять код и страну
    let cityTo: String      // То есть: FR - France, NL - Netherlands
    let countryTo: String
    let telephoneFirst: String
    let telephoneSecond: String
    let streetFrom: String
    let streetTo: String
    let companyName: String
    let zipcodeFrom: String
    let zipcodeTo: String
    let remarks: String
    let volumeFt: String
    let volumeM: String
    let business: Bool
    let storage: Bool
    let packing: String
    let assembly: String // В описании к Api они пишут, что эта сущность принимает только 0 и 1. НО это не так.
    // (0, 1, 2) - судя из Api. И у них на сайте Assembly это не числовая сущность. Там каждому числу
    // соответствует своя строка. Я пока оставлю это как Int. Нужно уточнить!!! Аналогично с Packing
    
    // "re_volume_calculator", которая закодирована в Api, является сущностью remarks.
    // прикол в том, что в Api также есть сущность "re_remarks"!
    // и у некоторых челиков remarks != nil и re_volume_calculator = *пустой словарь*. И наоборот (лол что хех)
    
    static func leadsData(id: String) -> [Lead]?{
        var leads = [Lead]()
        let Api = ApiLead(id: "1")
        if let json = Api.leadsJson{
            for obj in json{
                let lead = obj as! [String:String]
                let newLead = Lead(id: lead["re_id"]!, received: lead["ktrecupo_timestamp"]!, name: lead["re_full_name"]!, email: lead["re_email"]! , movingDate: lead["re_moving_date"]!, cityFrom: lead["re_city_from"]!, countryFrom: lead["re_co_code_from"]!, cityTo: lead["re_city_to"]!, countryTo: lead["re_co_code_to"]! , telephoneFirst: lead["re_telephone1"]!, telephoneSecond: lead["re_telephone2"]!, streetFrom: lead["re_street_from"]!, streetTo: lead["re_street_to"]! , companyName: lead["re_company_name"]!, zipcodeFrom: lead["re_zipcode_from"]!, zipcodeTo: lead["re_zipcode_to"]!, remarks: lead["re_remarks"]!, volumeFt: lead["re_volume_ft3"]!, volumeM: lead["re_volume_m3"]!, business: lead["re_business"]!.bool!, storage: lead["re_storage"]!.bool!, packing: lead["re_packing"]!, assembly: lead["re_assembly"]!)
                leads.append(newLead)
            }
            return leads
        }
        return nil
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
