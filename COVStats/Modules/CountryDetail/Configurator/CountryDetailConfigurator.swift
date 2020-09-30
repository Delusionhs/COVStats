//
//  CountryDetailCountryDetailConfigurator.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryDetailModuleConfigurator: CountryDetailConfiguratorProtocol {

    func configure(with viewController: CountryDetailViewController) {

        let router = CountryDetailRouter()

        let presenter = CountryDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CountryDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
