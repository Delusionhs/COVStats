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

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
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
        view.addSubview(tableView)
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CountryListTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func setupLayouts() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }


    // MARK: CountryListViewInput
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
