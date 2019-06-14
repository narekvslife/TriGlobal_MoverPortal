//
//  FreeLead.swift
//  TriGlobal_MoverPortal
//
//  Created by Nikolay Safonov on 13/06/2019.
//  Copyright © 2019 Narek. All rights reserved.
//

import Foundation

struct FreeLead {
    let id: String
    let timeLeft: String
    let price: String
    let matched: String
    let timeRaw: Int
    
    let cityFrom: String
    let countryFrom: String // Api возвращает код страны, а не название страны. Нужно сопоставлять код и страну
    let cityTo: String      // То есть: FR - France, NL - Netherlands
    let countryTo: String
    let movingDate: String
    let volumeFt: String
    let volumeM: String
}


