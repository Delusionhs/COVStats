//
//  CountryListCountryListInteractorOutput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol CountryListInteractorOutput: class {
    func countrySummaryDataDidRiceive (data: [СountrySummary]?)
    func countrySummaryYesterdayDataDidRiceive(data: [СountrySummaryYesterday]?)
}
