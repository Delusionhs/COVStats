//
//  EducationEducationRouter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 07/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//
import Foundation
import UIKit

class EducationRouter {
    private enum Sites {
        static let WHO = "https://www.who.int/"
    }

}

extension EducationRouter: EducationRouterInput {
    func openWhoWebsite() {
        guard let url = URL(string: Sites.WHO) else { return }
        UIApplication.shared.open(url)
    }
}
