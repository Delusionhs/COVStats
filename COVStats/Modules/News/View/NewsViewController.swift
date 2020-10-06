//
//  NewsNewsViewController.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewInput {

    var output: NewsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: NewsViewInput
    func setupInitialState() {
    }
}
