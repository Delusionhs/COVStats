//
//  EducationBodyViewPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 12.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct EducationBodyViewPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: EducationBodyView = {
        let view = EducationBodyView(frame: .zero)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(header)
        setupLayouts()
    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            header.leftAnchor.constraint(equalTo: view.leftAnchor),
            header.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}
#endif

