//
//  Int+Commas.swift
//  COVStats
//
//  Created by Igor Podolskiy on 30.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import Foundation

extension Int {
    func toStringWithDecimalStyle() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self)) ?? ""
    }
}
