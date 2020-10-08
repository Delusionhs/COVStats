//
//  UIImage + Kingfisher.swift
//  COVStats
//
//  Created by Igor Podolskiy on 02.10.2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import Kingfisher

extension UIImageView {
    func setImage(with url: URL?) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
