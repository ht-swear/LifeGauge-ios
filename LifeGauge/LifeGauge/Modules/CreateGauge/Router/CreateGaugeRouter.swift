//
//  CreateGaugeRouter.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit


class CreateGaugeRouter: CreateGaugeRouterInput
{
    weak var createGaugeViewController: CreateGaugeViewController!
    
    static func assembleModule() -> UIViewController?
    {
        //guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createGaugeViewControllerNav") as? UINavigationController else { return nil }
        //guard let view = navigation.topViewController as? CreateGaugeViewController else { return nil }
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createGaugeViewController") as? CreateGaugeViewController else { return nil }
        let presenter = CreateGaugePresenter()
        let interactor = CreateGaugeInteractor()
        let router = CreateGaugeRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.createGaugeViewController = view
        return view
    }
}
