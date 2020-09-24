//
//  CountryListCountryListViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController, CountryListViewInput {

    var output: CountryListViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CountryListViewInput

}
