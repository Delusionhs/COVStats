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
    let statisticsService: StatisticsServiceProtocol = StatisticsService()
}

extension GlobalSummaryInteractor: GlobalSummaryInteractorInput {
    func fetchSummaryData() {
        statisticsService.fetchGlobalSummaryData { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.globalSummaryDataDidRiceive(data: data)
            case .failure(_):
                self?.output.errorReceiveGlobalSummaryData(errorText: "test")
            }
        }
    }

    func fetchHistoricalData() {
        statisticsService.fetchGlobalHistoricalData { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.globalHistoricalDataDidRiceive(data: data)
            case .failure(_):
                self?.output.globalHistoricalDataDidRiceive(data: nil)
            }
        }
    }
}
