//
//  CircleViewCell.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/27.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

class CircleViewCell: UIView
{
    // Property
    var radian: Double?
    
    override init(frame: CGRect)
    {
        // Invoke super
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
