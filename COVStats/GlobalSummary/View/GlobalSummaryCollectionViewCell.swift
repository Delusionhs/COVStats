//
//  GlobalSummaryCollectionViewCell.swift
//  COVStats
//
//  Created by Igor Podolskiy on 22.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class GlobalSummaryCollectionViewCell: UICollectionViewCell {

    private let trendingImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let title: UILabel = {
           let label = UILabel(frame: .zero)
           label.textAlignment = .center
           label.numberOfLines = 1
           return label
       }()

    let casesCountLabel: UILabel = {
           let label = UILabel(frame: .zero)
           label.textAlignment = .center
           label.numberOfLines = 1
           return label
       }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayouts()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayouts() {
        trendingImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        casesCountLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
             trendingImageView.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 2.0),
             trendingImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
             trendingImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0)
        ])

        NSLayoutConstraint.activate([
             title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
             title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40.0),
             title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0)
        ])

        // Layout constraints for `usernameLabel`
        NSLayoutConstraint.activate([
             casesCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
             casesCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
             casesCountLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16.0)
        ])
    }
}

// MARK: Helper
extension GlobalSummaryCollectionViewCell {
    fileprivate func setup() {
        addSubview(casesCountLabel)
        addSubview(title)
        addSubview(trendingImageView)

        title.text = "Total Cases"
        casesCountLabel.text = "360,524"
        trendingImageView.image = UIImage(named: "trending-up")
        contentView.layer.borderWidth = 1
    }
}

