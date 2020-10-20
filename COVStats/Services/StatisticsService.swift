//
//  StatisticsService.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol StatisticsServiceProtocol {
    func fetchGlobalSummaryData(completion: @escaping (Result<GlobalSummaryCovidCases?, NetworkError>) -> Void)
    func fetchGlobalHistoricalData(completion: @escaping (Result<GlobalSummaryHistorical?, NetworkError>) -> Void)
    func fetchСountrySummaryData(completion: @escaping (Result<[СountrySummary]?, NetworkError>) -> Void)
    func fetchCountryHistoricalData(country: String, completion: @escaping (Result<CountryHistorical?, NetworkError>) -> Void)
    func fetchСountrySummaryYesterdayData(completion: @escaping (Result<[СountrySummaryYesterday]?, NetworkError>) -> Void)
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
        static let countrySummaryYesterday = "https://disease.sh/v3/covid-19/countries?yesterday=true&sort=cases"
    }

    private let networkService: NetworkServiceProtocol = NetworkService()

    private func fetchData<T: Decodable>(API: String, parametres: [String: Any] = [:], completion: @escaping (Result<T?, NetworkError>) -> Void) {
        guard let url = URL(string: API) else { return }
        networkService.getJSONData(URL: url, parameters: parametres) { result  in
            switch result {
            case .success(let data):
                let summary = try? JSONDecoder().decode(T.self, from: data)
                completion(.success(summary))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchGlobalSummaryData(completion: @escaping (Result<GlobalSummaryCovidCases?, NetworkError>) -> Void) {
        fetchData(API: ApiURL.globalSummary, completion: completion)
    }

    func fetchGlobalHistoricalData(completion: @escaping (Result<GlobalSummaryHistorical?, NetworkError>) -> Void) {
        fetchData(API: ApiURL.globalHistorical, completion: completion)
    }

    func fetchСountrySummaryData(completion: @escaping (Result<[СountrySummary]?, NetworkError>) -> Void) {
        fetchData(API: ApiURL.countrySummary, completion: completion)
    }

    func fetchCountryHistoricalData(country: String, completion: @escaping (Result<CountryHistorical?, NetworkError>) -> Void) {
        guard let country = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        fetchData(API:  ApiURL.countryHistorical+country, parametres: ["lastdays": "all"], completion: completion)
    }

    func fetchСountrySummaryYesterdayData(completion: @escaping (Result<[СountrySummaryYesterday]?, NetworkError>) -> Void) {
        fetchData(API: ApiURL.countrySummaryYesterday, completion: completion)
    }
}
