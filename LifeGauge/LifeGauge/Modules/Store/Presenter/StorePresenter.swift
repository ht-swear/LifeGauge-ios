//
//  StorePresenter.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

class StorePresenter: StoreViewOutput, StoreInteractorOutput {

    weak var view: StoreViewInput!
    var interactor: StoreInteractorInput!
    var router: StoreRouterInput!

    func viewIsReady() {

    }
}
