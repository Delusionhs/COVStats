//
//  InitialInitialRouter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class InitialRouter: InitialRouterInput {
    weak var viewController: InitialViewController!
    
    func initialScreenFinished() {
        viewController.navigationController?.navigationBar.isHidden = false
        viewController.tabBarController?.tabBar.isHidden = false
        //Change pop animation
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        viewController.navigationController?.view.layer.add(transition, forKey: kCATransition)

        viewController.navigationController?.popViewController(animated: false)
    }
}
