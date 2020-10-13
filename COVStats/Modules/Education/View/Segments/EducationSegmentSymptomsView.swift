//
//  EducationSegmentSymptomsView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 13.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//


import Foundation
import UIKit

class EducationSegmentSymptomsView: UIView {

    private enum Localization {
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
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
    }

    private func setupLayouts() {
    }
}




