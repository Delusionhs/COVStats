//
//  NewsNewsRouterInput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

protocol NewsRouterInput {
    func openNewsWithURL(url: URL)
    func stowAlertWithText(text: String)
}
