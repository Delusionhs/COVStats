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
    weak var viewController: NewsViewController!
}

extension NewsRouter: NewsRouterInput {
    func openNewsWithURL(url: URL) {
        UIApplication.shared.open(url)
    }

    func stowAlertWithText(text: String) {
        let alertVC = UIAlertController(
            title: "Error",
            message: text,
            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        viewController.present(alertVC, animated: true, completion: nil)
    }

}
