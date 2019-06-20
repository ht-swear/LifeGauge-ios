//
//  homeRouter.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class homeRouter: homeRouterInput
{
    weak var viewController: UIViewController!
    
    static func assembleModule() -> UIViewController?
    {
        guard let navigation = UIStoryboard(name: "home", bundle: nil).instantiateInitialViewController() as? UINavigationController else { return nil }
        guard let view = navigation.topViewController as? homeViewController else { return navigation }
        let presenter = homePresenter()
        let interactor = homeInteractor()
        let router = homeRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.viewController = view
        return navigation
    }
}
