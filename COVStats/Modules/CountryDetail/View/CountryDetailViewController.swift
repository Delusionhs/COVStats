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
        static let graphToHeaderDistanse: CGFloat = 25
        static let graphBottomMargin: CGFloat = -22
    }

    var output: CountryDetailViewOutput!

    private let headerView = CountryDetailHeaderView()
    private let trendingGraph = CountryDetailGraphView()


    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        output.viewIsReady()
        setupViews()
        setupLayouts()
    }

    private func setupViews() {
        view.addSubview(headerView)
        view.addSubview(trendingGraph)
    }

    private func setupLayouts() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        trendingGraph.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: LayoutOptions.headerViewHeight),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.headerHorizontalMargin),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.headerHorizontalMargin),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutOptions.headerTopMargin)
        ])

        NSLayoutConstraint.activate([
            trendingGraph.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: LayoutOptions.graphToHeaderDistanse),
            trendingGraph.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutOptions.headerHorizontalMargin),
            trendingGraph.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -LayoutOptions.headerHorizontalMargin),
            trendingGraph.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: LayoutOptions.graphBottomMargin)
        ])
    }
}

extension CountryDetailViewController: CountryDetailViewInput {
    func configureHeader(with viewModel: CountryDetailHeaderViewModel) {
        headerView.configure(with: viewModel)
        output.countryDetailDidSet(country: viewModel.country)
    }

    func configureGraph(viewModel: CountryDetailGraphViewModel) {
        trendingGraph.configure(with: viewModel)
    }
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
