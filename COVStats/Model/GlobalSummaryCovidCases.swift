//
//  GlobalSummary.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct GlobalSummaryCovidCases: Decodable {
    //let NewConfirmed: Int
    //let NewRecovered: Int
    //let NewDeaths: Int
    let TotalConfirmed: Int
    let TotalDeaths: Int
    let TotalRecovered: Int
}
