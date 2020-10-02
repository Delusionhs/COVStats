//
//  GlobalSummaryRecoveryGraphLegendPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GlobalSummaryRecoveryGraphLegendPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: GlobalSummaryRecoveryGraphLegend = {
        let view = GlobalSummaryRecoveryGraphLegend()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(header)
        setupLayouts()
        header.configure(count: 325932, name: "Affected")

    }

    override func viewDidLayoutSubviews() {
    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            header.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -400),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ])
    }
}
#endif


