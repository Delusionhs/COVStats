//
//  EducationSegmentsContainerView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 15.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class EducationSegmentsContainerView: UIView {

    let prevention = EducationSegmentPreventionView()
    let symptoms = EducationSegmentSymptomsView()
    let diagnosis = EducationSegmentDiagnosisView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(prevention)
        addSubview(symptoms)
        addSubview(diagnosis)
        symptoms.isHidden = true
        diagnosis.isHidden = true
    }

    func configurePreventionTabs(viewModel: [EducationSegmentPreventionViewTabViewModel]) {
        prevention.setupTabs(viewModels: viewModel)
    }

    func changeSegment(segment: EducationSegments) {
        switch segment {
        case .prevention:
            prevention.isHidden = false
            symptoms.isHidden = true
            diagnosis.isHidden = true
        case .symptoms:
            symptoms.isHidden = false
            prevention.isHidden = true
            diagnosis.isHidden = true
        case .diagnosis:
            symptoms.isHidden = true
            prevention.isHidden = true
            diagnosis.isHidden = false
        }
    }

    private func setupLayouts() {
        prevention.translatesAutoresizingMaskIntoConstraints = false
        symptoms.translatesAutoresizingMaskIntoConstraints = false
        diagnosis.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            prevention.trailingAnchor.constraint(equalTo: trailingAnchor),
            prevention.leadingAnchor.constraint(equalTo: leadingAnchor),
            prevention.topAnchor.constraint(equalTo: topAnchor),
            prevention.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            symptoms.trailingAnchor.constraint(equalTo: trailingAnchor),
            symptoms.leadingAnchor.constraint(equalTo: leadingAnchor),
            symptoms.topAnchor.constraint(equalTo: topAnchor),
            symptoms.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            diagnosis.trailingAnchor.constraint(equalTo: trailingAnchor),
            diagnosis.leadingAnchor.constraint(equalTo: leadingAnchor),
            diagnosis.topAnchor.constraint(equalTo: topAnchor),
            diagnosis.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}


