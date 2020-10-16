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

    func reportButtonPressed() {
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

    func viewModelsForSymptomsSegments() -> [EducationSegmentSymptomsViewTabViewModel] {
        var models: [EducationSegmentSymptomsViewTabViewModel] = []
        EducationSegments.Symptons.allCases.forEach { tab in
            models.append(EducationSegmentSymptomsViewTabViewModel(frequency: tab.frequency, tabText: tab.tabText))
        }
        return models
    }

    func segmentedControlChangeIndex(index: Int) {
        if index == 0 {
            view.changeSegmentsContainerSegment(segment: .prevention)
        }
        if index == 1 {
            view.changeSegmentsContainerSegment(segment: .symptoms)
        }
        if index == 2 {
            view.changeSegmentsContainerSegment(segment: .diagnosis)
        }
    }
}

