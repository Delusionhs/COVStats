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
        statisticsService.fetchСountrySummaryData { [weak self] data in
            self?.output.countrySummaryDataDidRiceive(data: data)
        }
    }

    func fetchCountrySummaryYesterdayData() {
        statisticsService.fetchСountrySummaryYesterdayData { [weak self] data in
            self?.output.countrySummaryYesterdayDataDidRiceive(data: data)
        }
    }
}
