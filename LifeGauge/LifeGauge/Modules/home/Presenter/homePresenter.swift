//
//  homePresenter.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

class homePresenter: homeViewOutput, homeInteractorOutput {    

    weak var view: homeViewInput!
    var interactor: homeInteractorInput!
    var router: homeRouterInput!

    func viewIsReady() {

    }
    
    // homeInteractorOutput
    func fetched(_ timeGauges: [TimeGauge]) {
        if timeGauges.count > 0 {
            self.view.show(timeGauges)
        }
    }
    
    // homeViewOutput
    func fetchTimeGauges() {
        self.interactor.fetchTimeGauges()
    }
}
