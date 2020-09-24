//
//  HomeViewConroller.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewInput {

    var output: HomeViewOutput!

    private let configurator: HomeConfiguratorProtocol = HomeConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }


}
