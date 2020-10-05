//
//  CountryDetailCountryDetailViewInput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

protocol CountryDetailViewInput: class {
    func configureHeader(with viewModel: CountryDetailHeaderViewModel)
    func configureGraph(viewModel: CountryDetailGraphViewModel)
}
