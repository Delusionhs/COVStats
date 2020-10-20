//
//  GlobalSummaryRouter.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class GlobalSummaryRouter: GlobalSummaryRouterInput {

    weak var viewController: GlobalSummaryViewController!

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
