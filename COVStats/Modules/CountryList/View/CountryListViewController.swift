//
//  CountryListCountryListViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 24/09/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    private enum ViewOption {
        static let layerBorderWidth: CGFloat = 1
        static let layerBorderCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
    }

    private enum HeaderOption {
        static let headerHeight: CGFloat = 85
    }

    private enum TableViewOption {
        static let cellSpaing: CGFloat = 15
        static let cellHeight: CGFloat = 80
    }

    private enum TableViewLayoutOption {
        static let margin: CGFloat = 10
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
        view.addSubview(header)
        view.addSubview(tableView)
        view.backgroundColor = .white
        setupTableView()
        setupLayouts()
        setupBorder()
    }

    private func setupTableView() {
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
            header.heightAnchor.constraint(equalToConstant: HeaderOption.headerHeight)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: TableViewLayoutOption.margin),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -TableViewLayoutOption.margin)
        ])
    }

    private func setupBorder() {
        view.layer.borderWidth = ViewOption.layerBorderWidth
        view.layer.cornerRadius = ViewOption.layerBorderCornerRadius
        view.layer.borderColor = ViewOption.layerBorderColor
    }
}

// MARK: CountryListViewInput

extension CountryListViewController: CountryListViewInput {
    func setupHeader(titleText: String, subTitleText: String) {
        header.configure(title: titleText, subTitle: subTitleText)
    }

    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: - TableView Delegate & DataSource

extension CountryListViewController: UITableViewDelegate {

}

extension CountryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //because instead of row, sections are used to implement spacing
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return output.numberOfRows()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // header for rows spacing
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewOption.cellSpaing
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryListTableViewCell.identifier, for: indexPath) as! CountryListTableViewCell
        if let cellViewModel = output.cellViewModel(for: indexPath) {
            cell.configure(with: cellViewModel)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewOption.cellHeight
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