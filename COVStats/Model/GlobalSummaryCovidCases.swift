//
//  GlobalSummary.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct GlobalSummaryCovidCases: Decodable {
    let cases: Int
    let deaths: Int
    let recovered: Int
    let active: Int
}
