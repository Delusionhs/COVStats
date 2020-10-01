//
//  CountryListCountryListPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

class CountryListPresenter {

    weak var view: CountryListViewInput!
    var interactor: CountryListInteractorInput!
    var router: CountryListRouterInput!
    var countrySummaryData: [СountrySummary]?

    private func setupHeader() {
        view.setupHeader(titleText: "Life Reports", subTitleText: "Top countries")
    }

    private func cellViewModelFromData(data: СountrySummary) -> CountryListTableViewCellViewModel {
        return CountryListTableViewCellViewModel(cases: data.cases.toStringWithDecimalStyle(), country: data.country, flagImageURL: data.countryInfo.flag)
    }
}

extension CountryListPresenter: CountryListViewOutput {
    func showCountryDetails(for indexPath: IndexPath) {
        guard let data = countrySummaryData, data.count > indexPath.section else { return }
        router.openCountryDetailsViewController(with: data[indexPath.section])
    }

    func viewIsReady() {
        setupHeader()
        interactor.fetchCountrySummaryData()
    }

    func numberOfRows() -> Int {
        return countrySummaryData?.count ?? 0
    }

    func cellViewModel(for indexPath: IndexPath) -> CountryListTableViewCellViewModel? {
        guard let data = countrySummaryData, data.count > indexPath.section else { return nil }
        return cellViewModelFromData(data: data[indexPath.section])
    }
}

extension CountryListPresenter: CountryListInteractorOutput {
    func countrySummaryDataDidRiceive(data: [СountrySummary]?) {
        self.countrySummaryData = data
        view.reloadTableViewData()
    }
}
