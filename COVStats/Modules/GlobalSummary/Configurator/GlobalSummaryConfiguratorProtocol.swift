//
//  GlobalSummaryConfiguratorProtocol.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

protocol GlobalSummaryConfiguratorProtocol {
    func configure(with viewController: GlobalSummaryViewController)
    func assemblyModule() -> UIViewController
}
