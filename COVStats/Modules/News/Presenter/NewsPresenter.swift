//
//  NewsNewsPresenter.swift
//  COVStats
//
//  Created by Igor Podolsiy on 06/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

class NewsPresenter: NewsModuleInput, NewsViewOutput, NewsInteractorOutput {

    weak var view: NewsViewInput!
    var interactor: NewsInteractorInput!
    var router: NewsRouterInput!

    func viewIsReady() {

    }
}
