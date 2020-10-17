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
    func fetchСountrySummaryData(completion: @escaping ([СountrySummary]?) -> Void)
    func fetchCountryHistoricalData(country: String, completion: @escaping (CountryHistorical?) -> Void)
}

class StatisticsService: StatisticsServiceProtocol {

    private enum QueryOption {
        static let historycalDaysCount = 15
    }

    private enum ApiURL {
        static let globalSummary = "https://disease.sh/v3/covid-19/all"
        static let globalHistorical = "https://disease.sh/v3/covid-19/historical/all?lastdays=" + String(QueryOption.historycalDaysCount)
        static let countrySummary = "https://disease.sh/v3/covid-19/countries?sort=cases"
        static let countryHistorical = "https://disease.sh/v3/covid-19/historical/"
    }

    private let networkService = NetworkService()

    private func fetchData<T: Decodable>(API: String, parametres: [String: Any] = [:], completion: @escaping (T?) -> Void) {
        guard let url = URL(string: API) else { return }
        networkService.getJSONData(URL: url, parameters: parametres) { data in
            if let data = data {
                let summary = try? JSONDecoder().decode(T.self, from: data)
                    completion(summary)
            }
        }
    }

    func fetchGlobalSummaryData(completion: @escaping (GlobalSummaryCovidCases?) -> Void) {
        fetchData(API: ApiURL.globalSummary, completion: completion)
    }

    func fetchGlobalHistoricalData(completion: @escaping (GlobalSummaryHistorical?) -> Void) {
        fetchData(API: ApiURL.globalHistorical, completion: completion)
    }

    func fetchСountrySummaryData(completion: @escaping ([СountrySummary]?) -> Void) {
        fetchData(API: ApiURL.countrySummary, completion: completion)
    }

    func fetchCountryHistoricalData(country: String, completion: @escaping (CountryHistorical?) -> Void) {
        guard let country = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        fetchData(API:  ApiURL.countryHistorical+country, parametres: ["lastdays": "all"], completion: completion)
    }
}
