//
//  InitialInitialViewOutput.swift
//  COVStats
//
//  Created by Igor Podolsiy on 09/10/2020.
//  Copyright © 2020 Igor Podolskiy. All rights reserved.
//

protocol InitialViewOutput {
    func viewIsReady()
    func pageViewModelForPage(pageIndex: Int) -> InitialPageContentViewModel?
    func pagesMaxIndex() -> Int
    func skipButtonPress()
}
