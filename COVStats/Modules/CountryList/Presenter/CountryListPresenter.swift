//
//  CountryListCountryListPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryListPresenter {

    weak var view: CountryListViewInput!
    var interactor: CountryListInteractorInput!
    var router: CountryListRouterInput!

    private func setupHeader() {
        view.setupHeader(titleText: "Life Reports", subTitleText: "Top countries")
    }
}

extension CountryListPresenter: CountryListViewOutput {
    func viewIsReady() {
        setupHeader()
        interactor.fetchCountrySummaryData()
    }
}

extension CountryListPresenter: CountryListInteractorOutput {
    func countrySummaryDataDidRiceive(data: [СountrySummary]?) {
        print(data)
    }


}
