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

    func viewModelsForPreventionsSegments() -> [EducationSegmentPreventionViewTabViewModel] {
        var models: [EducationSegmentPreventionViewTabViewModel] = []
        EducationSegments.Prevention.allCases.forEach { tab in
            models.append(EducationSegmentPreventionViewTabViewModel(imageName: tab.imageName, titleText: tab.titleText, tabText: tab.tabText))
        }
        return models
    }
}

