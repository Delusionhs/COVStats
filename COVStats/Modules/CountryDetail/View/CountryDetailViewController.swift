//
//  CountryDetailCountryDetailViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    var output: CountryDetailViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

extension CountryDetailViewController: CountryDetailViewInput {

}



// MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryDetailViewControllerPreview: PreviewProvider {

    static var previews: some View {
        CountryDetailViewController().toPreview()
    }
}
#endif
