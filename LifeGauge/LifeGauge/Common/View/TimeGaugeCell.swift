//
//  TimeGaugeCell.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/19.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

class TimeGaugeCell: UICollectionViewCell
{
    static let identifier = "TimeGaugeCell"
    
    // Property
    var timeGauge: TimeGauge? {
        didSet {
            self._setup()
        }
    }
    
    // Outlet
    @IBOutlet weak var gaugeLabel: UILabel!
    @IBOutlet weak var gaugeSlider: UISlider!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    private func _setup()
    {
        gaugeLabel.text = timeGauge?.description
        
        guard let timeGauge = timeGauge, let end = timeGauge.end, let start = timeGauge.start else { return }
        gaugeSlider.minimumValue = 0
        gaugeSlider.maximumValue = Float(end.timeIntervalSince1970 - start.timeIntervalSince1970)
        _update()
    }
    
    func _update()
    {
        guard let timeGauge = timeGauge, let start = timeGauge.start else { return }
        gaugeSlider.value = Float(Date().timeIntervalSince1970 - start.timeIntervalSince1970)
    }
}
