//
//  EducationSegmentDiagnosisView.swift
//  COVStats
//
//  Created by Igor Podolskiy on 15.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

protocol EducationSegmentDiagnosisViewButtonDelegate: class {
    func reportButtonTap()
}

class EducationSegmentDiagnosisView: UIView {
    weak var delegate: EducationSegmentDiagnosisViewButtonDelegate?

    private enum Localization {
        static let titleLabelText = "Report my Status"
        static let isolationText = "If you feel some symptoms or you are thinking that you may be infected. Please report your self so other people can be aware that someone who is in isolation is nearby them. "
        static let reportText = "COVSTATS gives everyone the opportunity to report their symptoms anonymously for the benefit of others"
    }

    private enum ViewOptions {
        static let titleLabelFontSize: CGFloat = 28
        static let isolatioLabelFontsize: CGFloat = 16
        static let isolationLabelFontColor = UIColor(hex: "#999999")
        //static let reportLabelStartColor = UIColor(hex: "#FF647C")
        static let reportLabelFontSize:CGFloat = 22
        static let reportButtonImage = UIImage(named: "reportButton")

    }

    private enum LayoutOptions {
        static let textLeftPadding: CGFloat = 25
        static let textRightPadding: CGFloat = -41
        static let elementsTopPadding: CGFloat = 25
        static let reportButtonHeight: CGFloat = 50
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.titleLabelFontSize, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.text = Localization.titleLabelText
        return label
    }()

    private let isolationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.isolatioLabelFontsize, weight: UIFont.Weight.light)
        label.textColor = ViewOptions.isolationLabelFontColor
        label.numberOfLines = 0
        label.text = Localization.isolationText
        return label
    }()
    private let reportLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: ViewOptions.reportLabelFontSize, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.text = Localization.reportText
        return label
    }()

    private let reportButton: UIButton = {
        let button = UIButton()
        button.setImage(ViewOptions.reportButtonImage, for: .normal)
        button.addTarget(self, action: #selector(reportButtonAction), for: .touchUpInside)
        return button
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
        addSubview(titleLabel)
        addSubview(isolationLabel)
        addSubview(reportLabel)
        addSubview(reportButton)
    }

    private func setupLayouts() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        isolationLabel.translatesAutoresizingMaskIntoConstraints = false
        reportLabel.translatesAutoresizingMaskIntoConstraints = false
        reportButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.textLeftPadding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.textRightPadding),
        ])

        NSLayoutConstraint.activate([
            isolationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.textLeftPadding),
            isolationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutOptions.elementsTopPadding),
            isolationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.textRightPadding),
        ])

        NSLayoutConstraint.activate([
            reportLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.textLeftPadding),
            reportLabel.topAnchor.constraint(equalTo: isolationLabel.bottomAnchor, constant: LayoutOptions.elementsTopPadding),
            reportLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.textRightPadding),
        ])

        NSLayoutConstraint.activate([
            reportButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutOptions.textLeftPadding),
            reportButton.topAnchor.constraint(equalTo: reportLabel.bottomAnchor, constant: LayoutOptions.elementsTopPadding),
            reportButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutOptions.textRightPadding),
        ])
    }
}

extension EducationSegmentDiagnosisView {
    @objc func reportButtonAction() {
        delegate?.reportButtonTap()
    }
}
