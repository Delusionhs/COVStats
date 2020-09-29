//
//  GlobalSummaryCollectionViewCellPreview.swift
//  COVStats
//
//  Created by Igor Podolskiy on 29.09.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct GlobalSummaryCollectionViewCellPreview: PreviewProvider {
    static var previews: some View {
        let viewController =  mockViewController()
        viewController.toPreview()
    }

}

fileprivate class mockViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    private enum CellLayoutOption {
        static let cellHeight: CGFloat = 208.0
        static let cellWidth: CGFloat = 157.0
        static let trendingX = [1,2,3,4,5,6,7,8,9,10]
        static let trendingY = [76,150,180,180,195,195,190,164,136,120]
    }

    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GlobalSummaryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
        setupLayouts()
    }

    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GlobalSummaryCollectionViewCell
        cell.configure(viewModel: GlobalSummaryCollectionViewCellViewModel(type: .activeCases, casesCountText: "356,014,000,0"))
        cell.configureTrendingGraph(xAxisData: CellLayoutOption.trendingX, yAxisData: CellLayoutOption.trendingY,type: .totalRecovered )
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: CellLayoutOption.cellWidth, height: CellLayoutOption.cellHeight)
    }

}
#endif

