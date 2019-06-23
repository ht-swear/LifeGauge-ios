//
//  homePresenter.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

class HomePresenter
{
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
}

extension HomePresenter: HomeViewOutput
{
    func viewIsReady() {
        
    }
    
    func fetchTimeGauges() {
        self.interactor.fetchTimeGauges()
    }
}

extension HomePresenter: HomeInteractorOutput
{
    func fetched(_ timeGauges: [TimeGauge]) {
        if timeGauges.count > 0 {
            self.view.show(timeGauges)
        }
    }
}
