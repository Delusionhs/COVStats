//
//  GlobalSummaryInteractorOutput.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol GlobalSummaryInteractorOutput: class {
    func globalSummaryDataDidRiceive (data: GlobalSummaryCovidCases?)
    func globalHistoricalDataDidRiceive (data: GlobalSummaryHistorical?)
}
