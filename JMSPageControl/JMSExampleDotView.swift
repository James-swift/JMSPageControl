//
//  JMExampleDotView.swift
//  JMSPageControl
//
//  Created by James.xiao on 2017/7/5.
//  Copyright © 2017年 James.xiao. All rights reserved.
//

import UIKit

private let kAnimateDuration: TimeInterval = 1

class JMSExampleDotView: JMSAbstractDotView {
    
    override init() {
        super.init()
        self.setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupViews()
    }
    
    override public func changeActivityState(active: Bool) {
        if active {
            self.animateToActiveState()
        }else {
            self.animateToDeactiveState()
        }
    }
    
    // MARK: - UI
    private func setupViews() {
        self.backgroundColor = .white
    }
    
    // MARK: - Change State
    private func animateToActiveState() {
        UIView.animate(withDuration: kAnimateDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: -20, options: .curveLinear, animations: {
            self.backgroundColor = .green
            self.transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4).rotated(by: CGFloat(Double.pi))
        }, completion: nil)
    }
    
    private func animateToDeactiveState() {
        UIView.animate(withDuration: kAnimateDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveLinear, animations: {
            self.backgroundColor = .white
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }

}
