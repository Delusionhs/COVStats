//
//  InitialInitialRouter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class InitialRouter: InitialRouterInput {
    weak var viewController: InitialViewController!
    
    func initialScreenFinished() {

        viewController.navigationController?.navigationBar.isHidden = false
        viewController.tabBarController?.tabBar.isHidden = false
        viewController.navigationController?.popViewController(animated: true)
    }
}
