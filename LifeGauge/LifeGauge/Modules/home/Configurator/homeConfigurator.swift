//
//  homeConfigurator.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class homeModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? homeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: homeViewController) {

        let router = homeRouter()

        let presenter = homePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = homeInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
