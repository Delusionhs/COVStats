//
//  CountryListTableViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    private enum CellOption {
        static let flagImageSize: CGFloat = 47.0
        static let flagImageHorisontalPadding: CGFloat = 10.0
        static let flagImageVerticalPadding: CGFloat = 10.0
        static let countryNameLabelVerticalPadding: CGFloat = 17.0
        static let trendingImageSize: CGFloat = 28
        static let trendingImageTrailingPadding: CGFloat = -10
        static let countlabelLeadingPadding: CGFloat = -4.0
    }

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
        self.contentView.addSubview(flagImage)
        self.contentView.addSubview(countryNameLabel)
        self.contentView.addSubview(trendingImage)
        self.contentView.addSubview(countLabel)
    }

    
    private func setupLayouts() {
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingImage.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CellOption.flagImageVerticalPadding),
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellOption.flagImageHorisontalPadding),
            flagImage.heightAnchor.constraint(equalToConstant: CellOption.flagImageSize),
            flagImage.widthAnchor.constraint(equalToConstant: CellOption.flagImageSize)
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: CellOption.countryNameLabelVerticalPadding),
        ])

        NSLayoutConstraint.activate([
            trendingImage.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            trendingImage.heightAnchor.constraint(equalToConstant: CellOption.trendingImageSize),
            trendingImage.widthAnchor.constraint(equalToConstant: CellOption.trendingImageSize),
            trendingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CellOption.trendingImageTrailingPadding)
        ])

        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trendingImage.leadingAnchor, constant: CellOption.countlabelLeadingPadding),
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: countLabel.leadingAnchor)
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
        cell.flagImage.image = UIImage(named: "usaFlag")
        cell.trendingImage.image = UIImage(named: "chevronUp")
        cell.countryNameLabel.text = "USA"
        cell.countLabel.text = "4343,34343"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
#endif
