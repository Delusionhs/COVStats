//
//  CountryListConfiguratorProtocol.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

protocol CountryListConfiguratorProtocol {
    func configure(with viewController: CountryListViewController)
    func assemblyModule() -> UIViewController
}

