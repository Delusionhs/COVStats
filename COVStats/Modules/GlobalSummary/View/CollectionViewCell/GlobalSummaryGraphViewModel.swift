//
//  GlobalSummaryGraphViewModel.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

struct GlobalSummaryGraphViewModel {
    let yAxisData: [Int]

    var xAxisData: [Int] {
        return Array(1...yAxisData.count)
    }
}
