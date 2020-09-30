//
//  CountryDetailCountryDetailPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryDetailPresenter: CountryDetailModuleInput, CountryDetailViewOutput, CountryDetailInteractorOutput {

    weak var view: CountryDetailViewInput!
    var interactor: CountryDetailInteractorInput!
    var router: CountryDetailRouterInput!

    func viewIsReady() {

    }
}
