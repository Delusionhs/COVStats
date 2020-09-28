//
//  СountrySummary.swift
//  COVStats
//
//  Created by Igor Podolskiy on 28.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct СountrySummary: Decodable {
    let country: String
    let countryInfo: CountryInfo
    let cases: Int
    let death: Int
}

struct CountryInfo: Decodable {
    let flag: String
}
