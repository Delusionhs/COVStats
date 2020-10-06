//
//  NewsNewsConfiguratorProtocol.swift
//  COVStats
//
//  Created by Igor Podolskiy on 06.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

protocol NewsConfiguratorProtocol {
    func configure(with viewController: NewsViewController)
    func assemblyModule() -> UIViewController
}
