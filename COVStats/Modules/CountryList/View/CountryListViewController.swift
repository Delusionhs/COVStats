//
//  CountryListCountryListViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    private enum HeaderOptions {
        static let headerHeight: CGFloat = 85
    }

    var output: CountryListViewOutput!

    private let configurator: CountryListConfiguratorProtocol = CountryListConfigurator()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()

    private let header: CountryListTableViewHeader = {
        let header = CountryListTableViewHeader()
        return header
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        configurator.configure(with: self)
        super.viewDidLoad()
        output.viewIsReady()
        setupTableView()
        setupLayouts()
    }

    private func setupTableView() {
        view.addSubview(header)
        view.addSubview(tableView)
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CountryListTableViewCell.self, forCellReuseIdentifier: CountryListTableViewCell.identifier)
    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor),
            header.heightAnchor.constraint(equalToConstant: HeaderOptions.headerHeight)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

// MARK: CountryListViewInput

extension CountryListViewController: CountryListViewInput {
    func setupHeader(titleText: String, subTitleText: String) {
        header.configure(title: titleText, subTitle: subTitleText)
    }
}

//MARK: - TableView Delegate & DataSource

extension CountryListViewController: UITableViewDelegate {

}

extension CountryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryListViewControllerPreview: PreviewProvider {

    static var previews: some View {
        CountryListViewController().toPreview()
    }
}
#endif
