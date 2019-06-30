//
//  PageRouter.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//
import UIKit


class PageRouter: PageRouterInput
{
    weak var pageViewController: PageViewController!
    
    static func assembleModule() -> PageViewController?
    {
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageViewController") as? PageViewController else { return nil }
        let presenter = PagePresenter()
        let interactor = PageInteractor()
        let router = PageRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        router.pageViewController = view
        
        return view
    }
}
