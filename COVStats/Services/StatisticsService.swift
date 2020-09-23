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
}

class StatisticsService: StatisticsServiceProtocol {

    private enum ApiURL {
        static let global = "https://disease.sh/v3/covid-19/all"
    }

    private let networkService = NetworkService()

    func fetchGlobalSummaryData(completion: @escaping (GlobalSummaryCovidCases?) -> Void) {
        guard let url = URL(string: ApiURL.global) else { return }
        networkService.getJSONData(URL: url) { data in
            if let data = data {
                let summary = try? JSONDecoder().decode(GlobalSummaryCovidCases.self, from: data)
                    completion(summary)
            }
        }
    }
}
