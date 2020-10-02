//
//  GlobalSummaryRecoveryGraphLegend.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class GlobalSummaryRecoveryGraphLegend: UIView {

    private enum ViewOptions {
        static let countLabelFontSize: CGFloat = 12
        static let nameLabelFontSize: CGFloat = 11
        static let colorCircleRadius: CGFloat = 5
    }

    private enum LayoutOptions {

    }

    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.countLabelFontSize, weight: UIFont.Weight.medium)
        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.nameLabelFontSize, weight: UIFont.Weight.regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(countLabel)
        addSubview(nameLabel)

    }

    private func setupLayouts() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewOptions.colorCircleRadius*3),
            countLabel.topAnchor.constraint(equalTo: topAnchor)
        ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: countLabel.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func drawLegendColorCircle(color: CGColor) {
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: ViewOptions.colorCircleRadius, y: ViewOptions.colorCircleRadius*1.3), radius: ViewOptions.colorCircleRadius, startAngle: 0 * CGFloat.pi, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
        shapeLayer.fillColor = color
    }

    func configure(count: Int, name: String, color: CGColor) {
        countLabel.text = count.toStringWithDecimalStyle()
        nameLabel.text = name
        drawLegendColorCircle(color: color)
    }
    
}
