//
//  StoreRouter.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit


class StoreRouter: StoreRouterInput
{
    weak var storeViewController: StoreViewController!
    
    static func assembleModule() -> UIViewController?
    {
        //guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storeViewControllerNav") as? UINavigationController else { return nil }
        //guard let view = navigation.topViewController as? StoreViewController else { return nil }
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "storeViewController") as? StoreViewController else { return nil }
        let presenter = StorePresenter()
        let interactor = StoreInteractor()
        let router = StoreRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.storeViewController = view
        return view
    }
}
