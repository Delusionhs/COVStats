//
//  CountryDetailCountryDetailInteractor.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryDetailInteractor {

    weak var output: CountryDetailInteractorOutput!
    let statisticsService: StatisticsServiceProtocol = StatisticsService()
}

extension CountryDetailInteractor: CountryDetailInteractorInput {
    func fetchCountryHistoricalData(country: String) {
        statisticsService.fetchCountryHistoricalData(country: country) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output.countryHistoricalDataDidRiceive(data: data)
            case .failure(_):
                self?.output.countryHistoricalDataDidRiceive(data: nil)
            }
        }
    }
}
