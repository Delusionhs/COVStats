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

    private let configurator: CountryListConfiguratorProtocol = CountryListConfigurator()

    // MARK: Life cycle
    override func viewDidLoad() {
        configurator.configure(with: self)
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CountryListViewInput

}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryListViewControllerPreview: PreviewProvider {

    static var previews: some View {
        CountryListViewController().toPreview()
    }
}
#endif
