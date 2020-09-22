//
//  GlobalSummaryViewConroller.swift
//  COVStats
//
//  Created by Igor Podolskiy on 21.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class GlobalSummaryViewController: UIViewController, GlobalSummaryViewInput {

    var output: GlobalSummaryViewOutput!

    private let configurator: GlobalSummaryConfiguratorProtocol = GlobalSummaryConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }


}
