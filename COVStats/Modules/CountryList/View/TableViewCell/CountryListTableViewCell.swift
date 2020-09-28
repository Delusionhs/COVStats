//
//  CountryListTableViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 24.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {

    private enum CellLayoutOption {
        static let flagImageHeight: CGFloat = 34.0
        static let flagImageWidth: CGFloat = 47.0
        static let flagImageHorisontalPadding: CGFloat = 10.0
        static let countryNameLabelVerticalPadding: CGFloat = 17.0
        static let trendingImageSize: CGFloat = 28
        static let trendingImageTrailingPadding: CGFloat = -10
        static let countlabelLeadingPadding: CGFloat = -4.0
        static let margin: CGFloat = 10
    }

    private enum CellOption {
        static let countryNameLabelFontSize:CGFloat = 22
        static let countNameLabelFontSize:CGFloat = 17
        static let layerBorderWidth: CGFloat = 1
        static let layerCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
    }

    let flagImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = CellOption.layerCornerRadius
        imgView.layer.borderWidth = CellOption.layerBorderWidth
        imgView.layer.borderColor = CellOption.layerBorderColor
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
        label.font = UIFont.boldSystemFont(ofSize: CellOption.countryNameLabelFontSize)
        return label
    }()

    let countLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CellOption.countNameLabelFontSize, weight: UIFont.Weight.semibold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
        setupBorder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.frame = layer.frame.inset(by: UIEdgeInsets(top: 0, left: CellLayoutOption.margin, bottom: 0, right: CellLayoutOption.margin))
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: CellLayoutOption.margin, bottom: 0, right: CellLayoutOption.margin*2))
    }

    private func setupViews() {
        self.contentView.addSubview(flagImage)
        self.contentView.addSubview(countryNameLabel)
        self.contentView.addSubview(trendingImage)
        self.contentView.addSubview(countLabel)
    }

    private func setupBorder() {
        layer.borderWidth = CellOption.layerBorderWidth
        layer.cornerRadius = CellOption.layerCornerRadius
        layer.borderColor = CellOption.layerBorderColor
    }

    
    private func setupLayouts() {
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        trendingImage.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            flagImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOption.flagImageHorisontalPadding),
            flagImage.heightAnchor.constraint(equalToConstant: CellLayoutOption.flagImageHeight),
            flagImage.widthAnchor.constraint(equalToConstant: CellLayoutOption.flagImageWidth)
        ])

        NSLayoutConstraint.activate([
            countryNameLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: CellLayoutOption.countryNameLabelVerticalPadding),
        ])

        NSLayoutConstraint.activate([
            trendingImage.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            trendingImage.heightAnchor.constraint(equalToConstant: CellLayoutOption.trendingImageSize),
            trendingImage.widthAnchor.constraint(equalToConstant: CellLayoutOption.trendingImageSize),
            trendingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CellLayoutOption.trendingImageTrailingPadding)
        ])

        NSLayoutConstraint.activate([
            countLabel.centerYAnchor.constraint(equalTo: flagImage.centerYAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trendingImage.leadingAnchor, constant: CellLayoutOption.countlabelLeadingPadding),
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



    private enum CellLayoutOption {
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

    func numberOfSections(in tableView: UITableView) -> Int {
          return 2
      }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryListTableViewCell
        cell.flagImage.image = UIImage(named: "esFlag")
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
