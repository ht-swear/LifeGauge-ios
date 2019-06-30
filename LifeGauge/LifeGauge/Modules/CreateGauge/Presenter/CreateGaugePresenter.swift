//
//  CreateGaugePresenter.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

class CreateGaugePresenter: CreateGaugeViewOutput, CreateGaugeInteractorOutput {

    weak var view: CreateGaugeViewInput!
    var interactor: CreateGaugeInteractorInput!
    var router: CreateGaugeRouterInput!

    func viewIsReady() {

    }
}
