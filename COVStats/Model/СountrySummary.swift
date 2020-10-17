//
//  СountrySummary.swift
//  COVStats
//
//  Created by Igor Podolskiy on 28.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct СountrySummary: Decodable {
    let cases: Int
    let country: String
    let countryInfo: CountryInfo
    let deaths: Int
    let todayDeaths: Int
    let todayCases: Int
}

struct СountrySummaryYesterday: Decodable {
    let cases: Int
    let country: String
}

struct CountryInfo: Decodable {
    let flag: String
}

