//
//  CountryListCountryListInteractor.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryListInteractor {
    weak var output: CountryListInteractorOutput!
    private let statisticsService: StatisticsServiceProtocol = StatisticsService()

}

extension CountryListInteractor: CountryListInteractorInput {
    func fetchCountrySummaryData() {
        statisticsService.fetchСountrySummaryData { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.countrySummaryDataDidRiceive(data: data)
            case .failure(_):
                self?.output.countrySummaryDataDidRiceive(data: nil)
            }
        }
    }

    func fetchCountrySummaryYesterdayData() {
        statisticsService.fetchСountrySummaryYesterdayData { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.countrySummaryYesterdayDataDidRiceive(data: data)
            case .failure(_):
                self?.output.countrySummaryYesterdayDataDidRiceive(data: nil)
            }
        }
    }
}
