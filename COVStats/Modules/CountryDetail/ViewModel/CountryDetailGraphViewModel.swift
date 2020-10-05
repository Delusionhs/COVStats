//
//  CountryDetailGraphViewModel.swift
//  COVStats
//
//  Created by Igor Podolskiy on 05.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

struct CountryDetailGraphViewModel {
    let affectedYAxisData: [Int]
    let deathYAxisData: [Int]

    var xAxisData: [Int] {
        return Array(1...min(affectedYAxisData.count,deathYAxisData.count))
    }
}
