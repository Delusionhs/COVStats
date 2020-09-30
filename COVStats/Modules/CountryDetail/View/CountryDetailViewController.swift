//
//  CountryDetailCountryDetailViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 30/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    private enum LayoutOptions {
        static let headerTopMargin: CGFloat = 40
        static let headerHorizontalMargin: CGFloat = 14
        static let headerViewHeight: CGFloat = 240
    }

    var output: CountryDetailViewOutput!

    private let configurator: CountryDetailConfiguratorProtocol = CountryDetailConfigurator()

    private let headerView = CountryDetailHeaderView()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        output.viewIsReady()
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        view.addSubview(headerView)
    }

    private func setupLayouts() {
        headerView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: LayoutOptions.headerViewHeight),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.headerHorizontalMargin),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.headerHorizontalMargin),
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: LayoutOptions.headerTopMargin)
        ])
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
