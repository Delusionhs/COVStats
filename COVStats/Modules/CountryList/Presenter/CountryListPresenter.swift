//
//  CountryListCountryListPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryListPresenter: CountryListViewOutput, CountryListInteractorOutput {

    weak var view: CountryListViewInput!
    var interactor: CountryListInteractorInput!
    var router: CountryListRouterInput!

    func viewIsReady() {
        setupHeader()
    }

    private func setupHeader() {
        view.setupHeader(titleText: "Life Reports", subTitleText: "Top countries")
    }
}
