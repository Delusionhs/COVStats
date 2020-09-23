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
    var graphViewModels: [GlobalSummaryGraphViewModel] = []

    private func setupCellViewModels(data: GlobalSummaryCovidCases) {
        for type in GlobalSummaryCollectionViewCellType.allCases {
            switch type {
            case .totalCases:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.cases),
                                                                               trending: .up))
            case .totatDeath:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.deaths),
                                                                               trending: .up))
            case .totalRecovered:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.recovered),
                                                                               trending: .down))
            case .activeCases:
                cellViewModels.append(GlobalSummaryCollectionViewCellViewModel(type: type,
                                                                               casesCountText: String(data.active),
                                                                               trending: .up))
            }
        }
    }

    private func setupGraphViewModels(data: GlobalSummaryHistorical) {
        graphViewModels.append(GlobalSummaryGraphViewModel(cases: data.casesTimeline))
        graphViewModels.append(GlobalSummaryGraphViewModel(cases: data.recoveredTimeline))
        graphViewModels.append(GlobalSummaryGraphViewModel(cases: data.activeTimeline))
        graphViewModels.append(GlobalSummaryGraphViewModel(cases: data.deathTimeline))
    }
}

extension GlobalSummaryPresenter: GlobalSummaryViewOutput {


    func viewIsReady() {
        interactor.fetchSummaryData()
        interactor.fetchHistoricalData()
    }

    func cellViewModel(for indexPath: IndexPath) -> GlobalSummaryCollectionViewCellViewModel? {
        guard cellViewModels.count > indexPath.row else { return nil }
        return cellViewModels[indexPath.row]
    }

    func graphViewModel(for indexPath: IndexPath) -> GlobalSummaryGraphViewModel? {
        guard graphViewModels.count > indexPath.row else { return nil }
        return graphViewModels[indexPath.row]
    }
}


extension GlobalSummaryPresenter: GlobalSummaryInteractorOutput {
    func globalSummaryDataDidRiceive(data: GlobalSummaryCovidCases?) {
        guard let data = data else { return }
        setupCellViewModels(data: data)
        view.reloadCollectionViewData()
    }

    func globalHistoricalDataDidRiceive(data: GlobalSummaryHistorical?) {
        guard let data = data else { return }
        setupGraphViewModels(data: data)
        view.reloadCollectionViewData()
    }
}
