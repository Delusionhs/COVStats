//
//  NewsNewsRouter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import Foundation
import UIKit

class NewsRouter {

}

extension NewsRouter: NewsRouterInput {
    func openNewsWithURL(url: URL) {
        UIApplication.shared.open(url)
    }

}
