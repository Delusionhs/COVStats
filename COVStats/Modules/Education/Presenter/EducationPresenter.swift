//
//  EducationEducationPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 07/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class EducationPresenter: EducationInteractorOutput {

    weak var view: EducationViewInput!
    var interactor: EducationInteractorInput!
    var router: EducationRouterInput!

}

extension EducationPresenter: EducationViewOutput {
    func seeMoreButtonPressed() {
        router.openWhoWebsite()
    }

    func viewIsReady() {

    }
}

