//
//  CircleItemView.swift
//  LifeGauge
//
//  Created by Yusaku Eigen on 2019/06/23.
//  Copyright © 2019 HT-Swear. All rights reserved.
//

import UIKit

protocol CircleMenuViewCellDelegate {
    func didSelect(cell: CircleMenuViewCell)
}

class CircleMenuViewCell: UIView
{
    var radian: Double?
    
    var delegate: CircleMenuViewCellDelegate?
    
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
