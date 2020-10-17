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
    private var countrySummaryData: [СountrySummary]?
    private var countrySummaryYesterdayData: [String:Int] = [:]

    private func setupHeader() {
        view.setupHeader(titleText: "Life Reports", subTitleText: "Top countries")
    }

    private func yesterdayTredingDataForCountryName(countryName: String, todayCount: Int) -> Trending {
        guard let yesterdayData = countrySummaryYesterdayData[countryName] else { return .notDetermined }
        let treding: Trending = todayCount <= yesterdayData ? .down : .up
        return treding
    }

    private func cellViewModelFromData(data: СountrySummary) -> CountryListTableViewCellViewModel {
        return CountryListTableViewCellViewModel(cases: data.cases.toStringWithDecimalStyle(), country: data.country, flagImageURL: data.countryInfo.flag, trending: yesterdayTredingDataForCountryName(countryName: data.country, todayCount: data.cases))
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
        interactor.fetchCountrySummaryYesterdayData()
    }

    func countrySummaryYesterdayDataDidRiceive(data: [СountrySummaryYesterday]?) {
        guard let data = data else { return }
        for countryData in data {
            countrySummaryYesterdayData[countryData.country] = countryData.cases
        }
        view.reloadTableViewData()
    }
}
