//
//  homeViewController.swift
//  LifeGauge-ios
//
//  Created by  on 18/06/2019.
//  Copyright © 2019 ht-swear. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    // Property
    var output: HomeViewOutput!
    
    var colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.cyan]
    
    private var timeGauges: [TimeGauge] = []
    
    private var circleView: CircleView?
    
    // Outlet
    
    //------------------------------------------------------------//
    // MARK: -- View --
    //------------------------------------------------------------//
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Notify to presenter
        output.viewIsReady()
        output.fetchTimeGauges()
        
        //let circleView = CircleMenuView(frame: CGRect(x: 0, y: view.frame.height - view.frame.width/2, width: view.frame.width, height: view.frame.width))
        circleView = CircleView(frame: view.frame)
        circleView?.delegate = self
        circleView?.dataSource = self
        view.addSubview(circleView!)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        // Invoke super
        super.viewWillAppear(animated)
        
        updateNavigationItem()
    }
    
    private func updateNavigationItem()
    {
        let leftItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshAction))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    //------------------------------------------------------------//
    // MARK: -- Action --
    //------------------------------------------------------------//
    
    @objc private func refreshAction()
    {
        colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.cyan, UIColor.orange, UIColor.yellow, UIColor.brown, UIColor.magenta]
        circleView?.reloadData()
    }
    
}

extension HomeViewController: HomeViewInput
{
    //------------------------------------------------------------//
    // MARK: -- homeViewInput --
    //------------------------------------------------------------//
    
    func setupInitialState() {
    }
    
    func show(_ timeGauges: [TimeGauge]) {
        self.timeGauges = timeGauges
    }
    
    func showNoting() {
        // Show custom noting screen
    }
}

extension HomeViewController: CircleViewDataSource
{
    func circleView(_ circlView: CircleView, cellForRowAt index: Int) -> CircleViewCell
    {
        let cell = circlView.dequeueCircleViewCell(for: index)
        cell.backgroundColor = colors[safe: index]
        return cell
    }
    
    func numberOfCircles(in circleView: CircleView) -> Int
    {
        return colors.count
    }
    
    func circleMenuView(_ circleMenuView: CircleMenuView, cellForRowAt index: Int) -> CircleMenuViewCell
    {
        let cell = circleMenuView.dequeueCircleItemView(for: index)
        cell.backgroundColor = colors[safe: index]
        return cell
    }
}

extension HomeViewController: CircleViewDelegate
{
    //------------------------------------------------------------//
    // MARK: -- CircleMenuViewDelegate --
    //------------------------------------------------------------//
    
    func circleView(_ circleView: CircleView, didSelectRowAt index: Int)
    {
    }
    
    func sizeForCell(in circleView: CircleView) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: view.frame.width - 32)
    }
    
    func diameterForTopCircle(in circleMenuView: CircleMenuView) -> CGFloat {
        return 50
    }
    
    func diameterForCell(in circleMenuView: CircleMenuView) -> CGFloat {
        return 40
    }
}
