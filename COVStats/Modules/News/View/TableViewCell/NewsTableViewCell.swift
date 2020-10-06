//
//  NewsTableViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 06.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    private enum CellLayoutOptions {
    }

    private enum CellOptions {
        static let titleLabelFontSize: CGFloat = 22
        static let readingTimeLabelSize: CGFloat = 12
        static let titleLabelNumberOfLines = 2
        static let toReadButtonFontSize: CGFloat = 12
    }

    let newsImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()


    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = CellOptions.titleLabelNumberOfLines
        label.font = UIFont.systemFont(ofSize: CellOptions.titleLabelFontSize, weight: UIFont.Weight.bold)
        return label
    }()

    let toReadButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: CellOptions.toReadButtonFontSize, weight: UIFont.Weight.light)
        return button
    }()

    let readingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CellOptions.readingTimeLabelSize, weight: UIFont.Weight.light)
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
        contentView.addSubview(newsImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(toReadButton)
        contentView.addSubview(readingTimeLabel)
        newsImage.image = UIImage(named: "esFlag")
        titleLabel.text = "Italy's first wave of the COVID-19 pandemic has ended: no excess mortality in May, 2020"
        readingTimeLabel.text = "12 MIN READ"
        toReadButton.setTitle("Continue Reading", for: .normal)
    }


    private func setupLayouts() {
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        toReadButton.translatesAutoresizingMaskIntoConstraints = false
        readingTimeLabel.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            newsImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(lessThanOrEqualTo: newsImage.bottomAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            toReadButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            //toReadButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            toReadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            toReadButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            readingTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            readingTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            readingTimeLabel.centerYAnchor.constraint(equalTo: toReadButton.centerYAnchor),
        ])

    }

}
