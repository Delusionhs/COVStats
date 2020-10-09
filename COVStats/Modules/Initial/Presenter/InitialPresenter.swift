//
//  InitialInitialPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class InitialPresenter: InitialInteractorOutput {

    weak var view: InitialViewInput!
    var interactor: InitialInteractorInput!
    var router: InitialRouterInput!

    private lazy var pagesViewModels: [InitialPageContentViewModel] = makePagesViewModels()

    private func makePagesViewModels() -> [InitialPageContentViewModel] {
        var result: [InitialPageContentViewModel] = []
        pagesData.allCases.forEach { page in
            result.append(InitialPageContentViewModel(imageName: page.imageName, title: page.title, text: page.text, pagesCount: pagesData.allCases.count, currentPage: page.rawValue))
        }
        return result
    }

}

extension InitialPresenter: InitialViewOutput {
    func viewIsReady() {
        guard pagesViewModels.indices.count >= 0 else {
            return
        }
        view.configureInitPage(with: pagesViewModels[0])
    }

    func pageViewModelForPage(pageIndex: Int) -> InitialPageContentViewModel? {
        guard pagesData.allCases.indices.contains(pageIndex) else { return nil }
        return pagesViewModels[pageIndex]
    }

    func pagesMaxIndex() -> Int {
        return pagesData.allCases.count == 0 ? 0 : pagesData.allCases.count-1
    }

}

extension InitialPresenter {
    enum pagesData: Int, CaseIterable {
        case fever
        case cough
        case breath

        var title: String {
            switch self {
            case .fever:
                return "Fever"
            case .cough:
                return "Cough"
            case .breath:
                return "Breathing Difficulty"
            }
        }

        var text: String {
            switch self {
            case .fever:
                return "He severity of COVID-19 symptoms can range from very mild to severe. Some people have no symptoms. People who are older or have existing chronic medical conditions."
            case .cough:
                return "Such as heart or lung disease or diabetis, may be at higher risk of serious illness. This is similar to what is seen with other respiratory illnesses, such influenza."
            case .breath:
                return "Contact your doctor or clinic right away if you have COVID-19 symptoms, you’ve been exposed to someone with COVID-19, or you live in or have traveled from an area with ongoing community spread of COVID-19."
            }
        }

        var imageName: String {
            switch self {
            case .fever:
                return "feverInitial"
            case .cough:
                return "coughInitial"
            case .breath:
                return "breathInitial"
            }
        }
    }
}
