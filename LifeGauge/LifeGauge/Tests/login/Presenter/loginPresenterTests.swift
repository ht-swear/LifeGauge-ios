//
//  loginPresenterTests.swift
//  LifeGauge-ios
//
//  Created by Rei Ishikawa on 17/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import XCTest

class loginPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: loginInteractorInput {

    }

    class MockRouter: loginRouterInput {

    }

    class MockViewController: loginViewInput {

        func setupInitialState() {

        }
    }
}
