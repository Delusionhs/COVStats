//
//  CountryListTableViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    let flagImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    let trendingImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()

    let countryNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    let countLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        self.addSubview(flagImage)
        self.addSubview(countryNameLabel)
        self.addSubview(trendingImage)
        self.addSubview(countLabel)
    }

    
    private func setupLayouts() {
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingImage.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            flagImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 17),
            countryNameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            trendingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            trendingImage.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            countLabel.trailingAnchor.constraint(equalTo: trendingImage.leadingAnchor, constant: -4),
            countLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor)
        ])
    }
}

// MARK: - Preview

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CountryListTableViewCellPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {



    private enum CellOption {
    }

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryListTableViewCell
        cell.flagImage.image = UIImage(named: "usFlag")
        cell.trendingImage.image = UIImage(named: "chevronUp")
        cell.countryNameLabel.text = "United States"
        cell.countLabel.text = "4343,34343"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
#endif
