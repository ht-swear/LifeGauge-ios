//
//  loginPresenter.swift
//  LifeGauge-ios
//
//  Created by Rei Ishikawa on 17/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

class loginPresenter: loginModuleInput, loginViewOutput, loginInteractorOutput {

    weak var view: loginViewInput!
    var interactor: loginInteractorInput!
    var router: loginRouterInput!

    func viewIsReady() {

    }
}
