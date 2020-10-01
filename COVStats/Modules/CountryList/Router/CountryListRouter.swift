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
    func openCountryDetailsViewController() {
        viewController.present(countryDetailConfigurator.assemblyModule(), animated: true, completion: nil)
        //viewController.navigationController?.pushViewController(countryDetailConfigurator.assemblyModule(), animated: true)
    }
}
