//
//  NewsNewsConfigurator.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class NewsModuleConfigurator: NewsNewsConfiguratorProtocol {

    func configure(with viewController: NewsViewController) {

        let router = NewsRouter()

        let presenter = NewsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = NewsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

    func assemblyModule() -> UIViewController {
        let viewController = NewsViewController()
        configure(with: viewController)
        return viewController
    }

}