//
//  StatisticsService.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol StatisticsServiceProtocol {
    func fetchGlobalSummaryData() -> GlobalSummaryCovidCases?
}

class StatisticsService: StatisticsServiceProtocol {

    private enum ApiURL {
        static let global = "https://coronavirus-19-api.herokuapp.com/all"
    }

    let networkService = NetworkService()

    func fetchGlobalSummaryData() -> GlobalSummaryCovidCases? {
        var summary: GlobalSummaryCovidCases? = nil
        guard let url = URL(string: ApiURL.global) else { return nil }
        networkService.getJSONData(URL: url) { data in
            guard let data = data else { return }
            summary = try? JSONDecoder().decode(GlobalSummaryCovidCases.self, from: data)
        }
        return summary
    }

}
