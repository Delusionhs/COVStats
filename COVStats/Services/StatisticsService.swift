//
//  StatisticsService.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol StatisticsServiceProtocol {
    func fetchGlobalSummaryData(completion: @escaping (GlobalSummaryCovidCases?) -> Void)
    func fetchGlobalHistoricalData(completion: @escaping (GlobalSummaryHistorical?) -> Void)
}

class StatisticsService: StatisticsServiceProtocol {

    private enum ApiURL {
        static let globalSummary = "https://disease.sh/v3/covid-19/all"
        static let globalHistorical = "https://disease.sh/v3/covid-19/historical/all?lastdays=15"
    }

    private let networkService = NetworkService()

    func fetchGlobalSummaryData(completion: @escaping (GlobalSummaryCovidCases?) -> Void) {
        guard let url = URL(string: ApiURL.globalSummary) else { return }
        networkService.getJSONData(URL: url) { data in
            if let data = data {
                let summary = try? JSONDecoder().decode(GlobalSummaryCovidCases.self, from: data)
                    completion(summary)
            }
        }
    }

    func fetchGlobalHistoricalData(completion: @escaping (GlobalSummaryHistorical?) -> Void) {
        guard let url = URL(string: ApiURL.globalHistorical) else { return }
        networkService.getJSONData(URL: url) { data in
            if let data = data {
                let historical = try? JSONDecoder().decode(GlobalSummaryHistorical.self, from: data)
                    completion(historical)
            }
        }
    }
}
