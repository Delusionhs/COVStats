//
//  CountryListCountryListRouter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class CountryListRouter {
    weak var viewController: CountryListViewController!
    private let countryDetailConfigurator: CountryDetailConfiguratorProtocol = CountryDetailConfigurator()
}

extension CountryListRouter: CountryListRouterInput {
    func openCountryDetailsViewController(with data: СountrySummary) {
        let viewModel = CountryDetailHeaderViewModel(country: data.country,
                                                     cases: data.cases.toStringWithDecimalStyle(),
                                                     death: data.deaths.toStringWithDecimalStyle(),
                                                     todayCases: data.todayCases.toStringWithDecimalStyle(),
                                                     todayDeath: data.todayDeaths.toStringWithDecimalStyle(),
                                                     flagImageURL: data.countryInfo.flag)
        viewController.navigationController?.pushViewController(countryDetailConfigurator.assemblyWithViewModel(viewModel: viewModel), animated: true)
    }
}
