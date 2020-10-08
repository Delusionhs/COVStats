//
//  InitialInitialPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class InitialPresenter: InitialModuleInput, InitialViewOutput, InitialInteractorOutput {

    weak var view: InitialViewInput!
    var interactor: InitialInteractorInput!
    var router: InitialRouterInput!

    func viewIsReady() {

    }
}
