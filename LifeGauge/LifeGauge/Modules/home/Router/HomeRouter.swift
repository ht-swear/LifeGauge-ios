//
//  homeRouter.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterInput
{
    weak var viewController: UIViewController!
    
    static func assembleModule() -> UIViewController?
    {
        //guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeViewControllerNav") as? UINavigationController else { return nil }
        //guard let view = navigation.topViewController as? HomeViewController else { return nil }
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController else { return nil }
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
