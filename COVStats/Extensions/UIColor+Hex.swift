//
//  UIColor+Hex.swift
//  COVStats
//
//  Created by Igor Podolskiy on 22.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hex = hex.lowercased()
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: alpha)
                    return
                }
            }
        }
        self.init(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
