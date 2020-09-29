//
//  CountryListCountryListViewOutput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol CountryListViewOutput {
    func viewIsReady()
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> CountryListTableViewCellViewModel?
}
