//
//  EducationBodyView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 12.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation
import UIKit

class EducationBodyView: UIView {

    private enum Localization {
        static let preventionSegmentTitle = "Prevention"
        static let symptomsSegmentTitle = "Symptoms"
        static let diagnosisSegmentTitle = "Diagnosis"
    }

    private enum SegmentedControlOptions {
        static let titleTextSize: CGFloat = 13
        static let normalTitleTextColor = UIColor(hex: "#999999")
        static let segmentedControlBarColor = UIColor(hex: "#96FFE1")
        static let segmentedControlSelectedBarColor = UIColor(hex: "#00C48C")
    }

    private enum ViewOptions {
    }

    private enum LayoutOptions {
        static let segmentedControlBarHeight:CGFloat = 5
    }

    let segmentedControl = UISegmentedControl()
    private let segmentedControlBar = UIView()
    private let segmentedControlSelectedBar = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupSegmentedControl()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSegmentedControl() {
        addSubview(segmentedControlSelectedBar)
        addSubview(segmentedControlBar)
        addSubview(segmentedControl)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: SegmentedControlOptions.titleTextSize,
                                                                                                 weight: UIFont.Weight.regular),
                                                 NSAttributedString.Key.foregroundColor: SegmentedControlOptions.normalTitleTextColor],
                                                for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: SegmentedControlOptions.titleTextSize,
                                                                                                 weight: UIFont.Weight.regular),
                                                 NSAttributedString.Key.foregroundColor: UIColor.black],
                                                for: .selected)
        segmentedControl.insertSegment(withTitle: Localization.preventionSegmentTitle, at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: Localization.symptomsSegmentTitle, at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: Localization.diagnosisSegmentTitle, at: 2, animated: true)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControlBar.backgroundColor = SegmentedControlOptions.segmentedControlBarColor
        segmentedControlSelectedBar.backgroundColor = SegmentedControlOptions.segmentedControlSelectedBarColor

        //segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: UIControl.Event.valueChanged)
    }

    private func setupViews() {
    }

    private func setupLayouts() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlBar.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlSelectedBar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControl.widthAnchor.constraint(equalTo: widthAnchor)
        ])

        NSLayoutConstraint.activate([
            segmentedControlBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            segmentedControlBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor),
            segmentedControlBar.heightAnchor.constraint(equalToConstant: LayoutOptions.segmentedControlBarHeight)
        ])

        NSLayoutConstraint.activate([
            segmentedControlSelectedBar.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            segmentedControlSelectedBar.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor, multiplier: 1 / CGFloat(segmentedControl.numberOfSegments)),
            segmentedControlSelectedBar.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor),
            segmentedControlSelectedBar.heightAnchor.constraint(equalToConstant: LayoutOptions.segmentedControlBarHeight)
        ])
    }

    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        UIView.animate(withDuration: 0.3) {
            self.segmentedControlSelectedBar.frame.origin.x = (self.segmentedControl.frame.width / CGFloat(self.segmentedControl.numberOfSegments)) * CGFloat(self.segmentedControl.selectedSegmentIndex)
        }
    }
}



