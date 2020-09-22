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

    let casesCountLabel: UILabel = {
           let label = UILabel(frame: .zero)
           label.textAlignment = .center
           label.numberOfLines = 0
           return label
       }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Helper
extension GlobalSummaryCollectionViewCell {
    fileprivate func setup() {
        addSubview(casesCountLabel)
        backgroundColor = .blue
    }
}

