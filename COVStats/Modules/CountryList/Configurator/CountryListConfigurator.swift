//
//  CountryListCountryListConfigurator.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListConfigurator: CountryListConfiguratorProtocol {

    func configure(with viewController: CountryListViewController) {

        let router = CountryListRouter()

        let presenter = CountryListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CountryListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

    func assemblyModule() -> UIViewController {
        let viewController = CountryListViewController()
        configure(with: viewController)
        return viewController
    }

}
