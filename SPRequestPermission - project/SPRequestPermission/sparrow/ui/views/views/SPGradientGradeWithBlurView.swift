//
//  SPGradientGradeBlurView.swift
//  SPADS
//
//  Created by Ivan Vorobei on 4/14/17.
//  Copyright © 2017 Ivan Vorobei. All rights reserved.
//

import UIKit

class SPGradientGradeWithBlurView: SPGradeWithBlurView {
    
    internal var gradientView: SPGradientView = SPGradientView()
    
    init() {
        super.init()
        self.commonInit()
    }
    
    private func commonInit() {
        self.insertSubview(self.gradientView, aboveSubview: self.gradeView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGradientStartColorPoint(_ point: CGPoint) {
        self.gradientView.startColorPoint = point
    }
    
    func setGradientEndColorPoint(_ point: CGPoint) {
        self.gradientView.endColorPoint = point
    }
    
    func setGradientStartColor(_ color: UIColor) {
        self.gradientView.startColor = color
    }
    
    func setGradientEndColor(_ color: UIColor) {
        self.gradientView.endColor = color
    }
    
    func setGradientAlpha(_ alpha: CGFloat) {
        self.gradientView.alpha = alpha
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientView.frame = self.bounds
    }
}
