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
    
    private var timeGauges: [TimeGauge] = [] {
        didSet {
            homeCollectionView.reloadData()
        }
    }
    
    // Outlet
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    //------------------------------------------------------------//
    // MARK: -- View --
    //------------------------------------------------------------//
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Configure collection view
        homeCollectionView.register(UINib(nibName: TimeGaugeCell.identifier, bundle: nil), forCellWithReuseIdentifier: TimeGaugeCell.identifier)
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        // Notify to presenter
        output.viewIsReady()
        output.fetchTimeGauges()
    }
    
    //------------------------------------------------------------//
    // MARK: -- Action --
    //------------------------------------------------------------//
    
    @objc private func timerAction()
    {
        for cell in homeCollectionView.visibleCells {
            guard let cell = cell as? TimeGaugeCell else { continue }
            cell._update()
        }
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

extension HomeViewController: UICollectionViewDataSource
{
    //------------------------------------------------------------//
    // MARK: -- UICollectionViewDataSource --
    //------------------------------------------------------------//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return timeGauges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeGaugeCell.identifier, for: indexPath) as? TimeGaugeCell else { return UICollectionViewCell() }
        guard let timeGauge = timeGauges[safe: indexPath.row] else { return cell }
        cell.timeGauge = timeGauge
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate
{
    //------------------------------------------------------------//
    // MARK: -- UICollectionViewDelegate --
    //------------------------------------------------------------//
}

extension HomeViewController: UICollectionViewDelegateFlowLayout
{
    //------------------------------------------------------------//
    // MARK: -- UICollectionViewDelegateFlowLayout --
    //------------------------------------------------------------//
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}
