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
    let movingDate: Date
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
    
    

}


