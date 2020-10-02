//
//  GlobalSummaryRecoveryGraph.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit
import Foundation

class GlobalSummaryRecoveryGraph: UIView  {

    private enum ViewOptions {
        static let layerBorderWidth: CGFloat = 1
        static let layerBorderCornerRadius: CGFloat = 10
        static let layerBorderColor: CGColor = UIColor(hex: "#E4E4E4", alpha: 0.6).cgColor
    }

    private enum GraphOptions {
        static let affectedShapeColor = UIColor(hex: "#FF647C").cgColor
        static let recoveredShapeColor = UIColor(hex: "#FF98A8").cgColor
        static let innerCircleShapeColor = UIColor(hex: "#E4E4E4").cgColor
        static let shapeLineWidth: CGFloat = 10
        static let affectedShapeRadius: CGFloat = 100
        static let recoveredShapeRadius: CGFloat = 80
        static let innerCircleShapeRadius: CGFloat = 60
        static let shapesStartAngle: CGFloat = 0.5
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
        setupBorder()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        setupInnerCircleShape()
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

    private func setupAffectedShape(endAngleFactor: CGFloat) {
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: GraphOptions.affectedShapeRadius, startAngle: GraphOptions.shapesStartAngle * CGFloat.pi, endAngle: endAngleFactor * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = GraphOptions.affectedShapeColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = GraphOptions.shapeLineWidth
    }

    private func setupRecoveredShape(endAngleFactor: CGFloat) {
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: GraphOptions.recoveredShapeRadius, startAngle: GraphOptions.shapesStartAngle * CGFloat.pi, endAngle: endAngleFactor * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = GraphOptions.recoveredShapeColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = GraphOptions.shapeLineWidth
    }

    private func setupInnerCircleShape() {
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: GraphOptions.innerCircleShapeRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = GraphOptions.innerCircleShapeColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.lineWidth = GraphOptions.shapeLineWidth
    }

    func configure(affected: Int, recovered: Int) {
        let affected = Double(affected)
        let recovered = Double(recovered)
        let recoveredRatio = recovered/affected
        setupRecoveredShape(endAngleFactor: 2.0*CGFloat(recoveredRatio)+0.5)
        setupAffectedShape(endAngleFactor: 2.5-(2.0*CGFloat(recoveredRatio)))
    }

}
