//
//  InitialInitialConfigurator.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class InitialConfigurator: InitialConfiguratorProtocol {

    private func configure(with viewController: InitialViewController) {

        let router = InitialRouter()

        let presenter = InitialPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = InitialInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

    func assemblyModule() -> UIViewController {
        let viewController = InitialViewController()
        configure(with: viewController)
        return viewController
    }

}
