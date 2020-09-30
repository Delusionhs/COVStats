//
//  CountryDetailGraphView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 01.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit
import Charts

class CountryDetailGraphView: UIView {

    private enum ViewOptions {
        static let layerBorderWidth: CGFloat = 1
        static let layerBorderCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
        setupBorder()
    }

    private func setupViews() {
    }

    private func setupLayouts() {
    }

    private func setupBorder() {
        layer.borderWidth = ViewOptions.layerBorderWidth
        layer.cornerRadius = ViewOptions.layerBorderCornerRadius
        layer.borderColor = ViewOptions.layerBorderColor
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
