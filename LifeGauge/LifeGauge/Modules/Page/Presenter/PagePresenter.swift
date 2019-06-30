//
//  PagePresenter.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

class PagePresenter: PageViewOutput, PageInteractorOutput {

    weak var view: PageViewInput!
    var interactor: PageInteractorInput!
    var router: PageRouterInput!

    func viewIsReady() {

    }
}
