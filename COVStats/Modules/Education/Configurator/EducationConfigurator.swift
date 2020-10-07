//
//  EducationEducationConfigurator.swift
//  COVStats
//
//  Created by Igor Podolsiy on 07/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class EducationConfigurator: EducationConfiguratorProtocol {

    private func configure(with viewController: EducationViewController) {

        let router = EducationRouter()

        let presenter = EducationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = EducationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

    func assemblyModule() -> UIViewController {
        let viewController = EducationViewController()
        configure(with: viewController)
        return viewController
    }

}
