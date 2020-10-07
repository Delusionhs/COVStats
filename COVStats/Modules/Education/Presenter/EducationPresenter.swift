//
//  EducationEducationPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 07/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class EducationPresenter: EducationModuleInput, EducationViewOutput, EducationInteractorOutput {

    weak var view: EducationViewInput!
    var interactor: EducationInteractorInput!
    var router: EducationRouterInput!

    func viewIsReady() {

    }
}
