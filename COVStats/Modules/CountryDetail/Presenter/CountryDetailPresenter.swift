//
//  CountryDetailCountryDetailPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryDetailPresenter: CountryDetailModuleInput {

    weak var view: CountryDetailViewInput!
    var interactor: CountryDetailInteractorInput!
    var router: CountryDetailRouterInput!
}

extension CountryDetailPresenter: CountryDetailViewOutput {
    func viewIsReady() {
        interactor.fetchCountryHistoricalData(country: "Russia")
    }
}

extension CountryDetailPresenter: CountryDetailInteractorOutput {
    func countryHistoricalDataDidRiceive(data: CountryHistorical?) {
        print(data)
    }
}
