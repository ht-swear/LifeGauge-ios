//
//  CircleViewCell.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/27.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

protocol CircleViewCellDelegate {
    func didSelect(cell: CircleViewCell)
}

class CircleViewCell: UIView
{
    // Property
    var radian: Double?
    
    var delegate: CircleViewCellDelegate?
    
    override init(frame: CGRect)
    {
        // Invoke super
        super.init(frame: frame)
        
        // Add tap gesture recognizer
        self.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(recognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapAction()
    {
        // Notify to delegate
        delegate?.didSelect(cell: self)
    }
}
