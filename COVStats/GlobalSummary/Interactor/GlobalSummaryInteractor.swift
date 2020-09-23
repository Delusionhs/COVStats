//
//  GlobalSummaryInteractor.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

class GlobalSummaryInteractor {
    weak var output: GlobalSummaryInteractorOutput!
    let statisticsService: StatisticsService = StatisticsService()
}

extension GlobalSummaryInteractor: GlobalSummaryInteractorInput {
    func fetchSummaryData() {
        statisticsService.fetchGlobalSummaryData { [weak self] data in
            self?.output.globalSummaryDataDidRiceive(data: data)
        }
    }
}
