//
//  loginConfiguratorTests.swift
//  LifeGauge-ios
//
//  Created by Rei Ishikawa on 17/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import XCTest

class loginModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = loginViewControllerMock()
        let configurator = loginModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "loginViewController is nil after configuration")
        XCTAssertTrue(viewController.output is loginPresenter, "output is not loginPresenter")

        let presenter: loginPresenter = viewController.output as! loginPresenter
        XCTAssertNotNil(presenter.view, "view in loginPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in loginPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is loginRouter, "router is not loginRouter")

        let interactor: loginInteractor = presenter.interactor as! loginInteractor
        XCTAssertNotNil(interactor.output, "output in loginInteractor is nil after configuration")
    }

    class loginViewControllerMock: loginViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
