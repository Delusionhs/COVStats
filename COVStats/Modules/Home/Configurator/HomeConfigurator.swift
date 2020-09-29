//
//  HomeConfigurator.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

class HomeConfigurator: HomeConfiguratorProtocol {

    private let countryListConfigurator: CountryListConfiguratorProtocol = CountryListConfigurator()
    private let globalSummaryConfigurator: GlobalSummaryConfiguratorProtocol = GlobalSummaryConfigurator()

    func configure(with viewController: HomeViewController) {

        let router = HomeRouter()
        router.viewController = viewController

        let presenter = HomePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = HomeInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        viewController.countryListViewController = countryListConfigurator.assemblyModule()
        viewController.globalSummaryViewController = globalSummaryConfigurator.assemblyModule()
    }

}
