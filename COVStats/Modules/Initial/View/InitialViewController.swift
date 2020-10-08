//
//  InitialInitialViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, InitialViewInput {

    var output: InitialViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

}
