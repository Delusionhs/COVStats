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

    private enum LayoutOptions {
    }

    private let trendingGraph: LineChartView = {
        let lineChartView = LineChartView()
        return lineChartView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
        setupBorder()
    }


    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        addSubview(trendingGraph)
        setupGraph()
    }

    private func setupGraph() {
        trendingGraph.isUserInteractionEnabled = false
        trendingGraph.xAxis.drawGridLinesEnabled = false
        trendingGraph.xAxis.drawAxisLineEnabled = false
        trendingGraph.xAxis.drawLabelsEnabled = false
        trendingGraph.legend.enabled = false
        trendingGraph.rightAxis.enabled = false
        trendingGraph.leftAxis.enabled = false
    }
    

    private func setupLayouts() {
        trendingGraph.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            trendingGraph.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            trendingGraph.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            trendingGraph.topAnchor.constraint(equalTo: self.topAnchor),
            trendingGraph.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupBorder() {
        layer.borderWidth = ViewOptions.layerBorderWidth
        layer.cornerRadius = ViewOptions.layerBorderCornerRadius
        layer.borderColor = ViewOptions.layerBorderColor
    }

    func configureTrendingGraph(xAxisData: [Int], yAxisData: [Int]) {

        var lineDataEntry: [ChartDataEntry] = []

        for i in 0..<min(xAxisData.count, yAxisData.count) {
            lineDataEntry.append(ChartDataEntry(x: Double(xAxisData[i]), y: Double(yAxisData[i])))
        }

        let lineDataSet = LineChartDataSet(entries: lineDataEntry, label: "Cases")
        let lineData = LineChartData()
        lineData.addDataSet(lineDataSet)
        lineData.setDrawValues(false)
        lineDataSet.mode = .cubicBezier
        lineDataSet.drawCirclesEnabled = false
        lineDataSet.colors = [.red]
        //gradient colors
        let gradientColors = [UIColor(hex: "#FF647C").cgColor,UIColor(hex: "#FFCBD3").cgColor] as CFArray
        let colorLocation: [CGFloat] = [0.3,1.0]
        if let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocation) {
            lineDataSet.fill = Fill.fillWithLinearGradient(gradient, angle: 1.0)
            lineDataSet.drawFilledEnabled = true
        }
        //
        trendingGraph.data = lineData
    }

}
