//
//  GlobalSummaryCollectionViewCellViewModel.swift
//  COVStats
//
//  Created by Igor Podolskiy on 23.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

enum GlobalSummaryCollectionViewCellType: String, CaseIterable {
    case totalCases = "Total Cases"
    case totalRecovered = "Recovered"
    case activeCases = "Active Cases"
    case totatDeath = "Total Death"
}

struct GlobalSummaryCollectionViewCellViewModel {
    let type: GlobalSummaryCollectionViewCellType
    let casesCountText: String
    let trending: Trending
}

struct GlobalSummaryGraphViewModel {
    let cases: [Int]
}
