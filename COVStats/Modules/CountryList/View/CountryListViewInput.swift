//
//  CountryListCountryListViewInput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

protocol CountryListViewInput: class {
    func setupHeader(titleText: String, subTitleText: String)
    func reloadTableViewData()
}
