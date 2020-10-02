//
//  GlobalSummaryRecoveryGraphPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GlobalSummaryRecoveryGraphPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController {

    private let header: GlobalSummaryRecoveryGraph = {
        let view = GlobalSummaryRecoveryGraph()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(header)
        setupLayouts()
    }

    override func viewDidLayoutSubviews() {
        header.configure( viewModel: GlobalSummaryRecoveryGraphViewModel(affected: 338225, recovered: 96958), center: CGPoint(x: header.bounds.maxX/2, y: header.bounds.maxY/2))
    }

    private func setupLayouts() {
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            header.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            header.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            header.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
#endif


