//
//  PageViewController.swift
//  LifeGauge-ios
//
//  Created by  on 30/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController
{
    // Property
    var output: PageViewOutput!
    
    lazy var home: UIViewController? = {
        return HomeRouter.assembleModule()
    }()
    
    lazy var store: UIViewController? = {
        return StoreRouter.assembleModule()
    }()
    
    lazy var create: UIViewController? = {
        return CreateGaugeRouter.assembleModule()
    }()
    

    // MARK: Life cycle
    override func viewDidLoad()
    {
        // Invoke super
        super.viewDidLoad()
        
        set()
        
        // Notifiy to delegate
        output.viewIsReady()
    }
    
    private func set()
    {
        guard let home = home else { return }
        setViewControllers([home], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
}

extension PageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if viewController == store {
            return home
        }
        else if viewController == home {
            return create
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController == home {
            return store
        }
        else if viewController == create {
            return home
        }
        
        return nil
    }
}

extension PageViewController: PageViewInput
{
    func setupInitialState()
    {
    }
}
