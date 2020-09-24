//
//  GlobalSummaryViewOutput.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol GlobalSummaryViewOutput: class {
    func viewIsReady()
    func cellViewModel(for indexPath: IndexPath) -> GlobalSummaryCollectionViewCellViewModel?
    func graphViewModel(for indexPath: IndexPath) -> GlobalSummaryGraphViewModel?
}
