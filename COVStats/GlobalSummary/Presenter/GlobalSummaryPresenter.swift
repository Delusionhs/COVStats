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

    var cellViewModels: [GlobalSummaryCollectionViewCellViewModel] = []

    func setupCellViewModels(data: GlobalSummaryCovidCases) {
        for type in GlobalSummaryCollectionViewCellType.allCases {
            switch type {
            case .totalCases:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.cases),
                                                                               trending: .down))
            case .totatDeath:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.deaths),
                                                                               trending: .down))
            case .totalRecovered:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.recovered),
                                                                               trending: .up))
            case .activeCases:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.cases-data.recovered),
                                                                               trending: .down))
            }
        }
    }
}

extension GlobalSummaryPresenter: GlobalSummaryViewOutput {
    func viewIsReady() {
        interactor.fetchSummaryData()
    }

    func cellViewModel(for indexPath: IndexPath) -> GlobalSummaryCollectionViewCellViewModel? {
        guard cellViewModels.count > indexPath.row else { return nil }
        return cellViewModels[indexPath.row]
    }
}


extension GlobalSummaryPresenter: GlobalSummaryInteractorOutput {
    func globalSummaryDataDidRiceive(data: GlobalSummaryCovidCases?) {
        guard let data = data else { return }
        setupCellViewModels(data: data)
        view.reloadCollectionViewData()
    }
}
