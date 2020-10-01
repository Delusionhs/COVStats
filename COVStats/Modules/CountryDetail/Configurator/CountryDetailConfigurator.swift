//
//  CountryDetailCountryDetailConfigurator.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryDetailConfigurator: CountryDetailConfiguratorProtocol {

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

    func assemblyModule() -> UIViewController {
        let viewController = CountryDetailViewController()
        configure(with: viewController)
        return viewController
    }

    func assemblyWithViewModel(viewModel: CountryDetailHeaderViewModel) -> UIViewController {
        let viewController = CountryDetailViewController()
        viewController.configureHeader(with: viewModel)
        configure(with: viewController)
        return viewController
    }
}
