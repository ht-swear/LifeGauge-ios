//
//  homeInteractor.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput{

    weak var output: HomeInteractorOutput!
    
    
    // homeInteractorInput
    func fetchTimeGauges()
    {
        // Send request to server...
        
        let birthday  = Date(timeIntervalSince1970: 813942000)
        let timeGauges = [
            TimeGauge(id: "id", description: "Progress of this minitue", start: Date(), end: Date(timeInterval: 60, since: Date())),
            TimeGauge(id: "id", description: "Progress of your life", start: birthday, end: Date(timeInterval: 60*60*24*365*60, since: Date()))
        ]
        
        // Notify to presenter
        self.output.fetched(timeGauges)
    }
}
