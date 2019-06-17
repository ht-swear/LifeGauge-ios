//
//  loginConfigurator.swift
//  LifeGauge-ios
//
//  Created by Rei Ishikawa on 17/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class loginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? loginViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: loginViewController) {

        let router = loginRouter()

        let presenter = loginPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = loginInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
