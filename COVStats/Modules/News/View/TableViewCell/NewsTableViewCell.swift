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
        static let textHorizontalPadding: CGFloat = 25
        static let titleVerticalPadding: CGFloat = 25
        static let toReadButtonTopPadding: CGFloat = 20
        static let toReadButtonBottomPadding: CGFloat = 30
    }

    private enum CellOptions {
        static let titleLabelFontSize: CGFloat = 22
        static let readingTimeLabelSize: CGFloat = 12
        static let titleLabelNumberOfLines = 2
        static let toReadButtonFontSize: CGFloat = 12
        static let toReadButtonTitle = "CONTINUE READING"
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

    let toReadLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = CellOptions.toReadButtonTitle
        label.font = UIFont.systemFont(ofSize: CellOptions.toReadButtonFontSize, weight: UIFont.Weight.light)
        return label
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
        contentView.addSubview(toReadLabel)
        contentView.addSubview(readingTimeLabel)
    }


    private func setupLayouts() {
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        toReadLabel.translatesAutoresizingMaskIntoConstraints = false
        readingTimeLabel.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            newsImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: CellLayoutOptions.titleVerticalPadding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOptions.textHorizontalPadding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOptions.textHorizontalPadding)
        ])

        NSLayoutConstraint.activate([
            toReadLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CellLayoutOptions.textHorizontalPadding),
            toReadLabel.trailingAnchor.constraint(lessThanOrEqualTo: readingTimeLabel.leadingAnchor),
            toReadLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -CellLayoutOptions.toReadButtonBottomPadding),
            toReadLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CellLayoutOptions.toReadButtonTopPadding)
        ])

        NSLayoutConstraint.activate([
            readingTimeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CellLayoutOptions.textHorizontalPadding),
            readingTimeLabel.centerYAnchor.constraint(equalTo: toReadLabel.centerYAnchor),
        ])

    }

    func configure(with viewModel: NewsTableViewCellViewModel) {
        if let url = URL(string: viewModel.imageURL) {
            newsImage.setImage(with: url)
        }
        titleLabel.text = viewModel.title
    }

}

// MARK: - Helpers
extension NewsTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

