//
//  CountryDetailCountryDetailPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryDetailPresenter {

    weak var view: CountryDetailViewInput!
    var interactor: CountryDetailInteractorInput!
    var router: CountryDetailRouterInput!
}

extension CountryDetailPresenter: CountryDetailViewOutput {
    func viewIsReady() {
    }

    func countryDetailDidSet(country: String) {
        interactor.fetchCountryHistoricalData(country: country)
    }
}

extension CountryDetailPresenter: CountryDetailInteractorOutput {
    func countryHistoricalDataDidRiceive(data: CountryHistorical?) {
        guard let data = data else { return }
        view.configureGraph(viewModel: CountryDetailGraphViewModel(affectedYAxisData: data.timeline.casesPerDayTimeline, deathYAxisData: data.timeline.deathsPerDayTimeline))
    }
}

extension CountryDetailPresenter: CountryDetailModuleInput {
}
