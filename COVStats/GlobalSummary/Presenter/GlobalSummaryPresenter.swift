//
//  GlobalSummaryPresenter.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation


class GlobalSummaryPresenter {

    weak var view: GlobalSummaryViewInput!
    var interactor: GlobalSummaryInteractorInput!
    var router: GlobalSummaryRouterInput!

    var globalSummaryData: GlobalSummaryCovidCases?
}

extension GlobalSummaryPresenter: GlobalSummaryViewOutput {
    func viewIsReady() {
        interactor.fetchSummaryData()
    }
}


extension GlobalSummaryPresenter: GlobalSummaryInteractorOutput {
    func globalSummaryDataDidRiceive(data: GlobalSummaryCovidCases?) {
        self.globalSummaryData = data
        view.reloadCollectionViewData()
    }
}
