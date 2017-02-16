// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public class SPSegmentedControl: UIControl {
    
    var indicatorView: UIView = UIView()
    var cells: [SPSegmentedControlCell] = []
    var styleDelegate: SPSegmentControlCellStyleDelegate?
    var delegate: SPSegmentControlDelegate?
    var defaultSelectedIndex: Int = 0
    var isUpdateToNearestIndexWhenDrag: Bool = true
    
    var selectedIndex : Int = 0 {
        didSet {
            if (selectedIndex < 0) {
                selectedIndex = 0
            }
            if (selectedIndex >= self.cells.count) {
                selectedIndex = self.cells.count - 1
            }
            updateSelectedIndex()
        }
    }
    
    var isScrollEnabled: Bool = true {
        didSet {
            self.panGestureRecognizer.isEnabled = self.isScrollEnabled
        }
    }
    
    var isSwipeEnabled: Bool = true {
        didSet {
            self.leftSwipeGestureRecognizer.isEnabled = self.isSwipeEnabled
            self.rightSwipeGestureRecognizer.isEnabled = self.isSwipeEnabled
        }
    }
    
    var isRoundedFrame: Bool = true {
        didSet {
            layoutIfNeeded()
        }
    }
    
    var roundedRelativeFactor: CGFloat = 0.5 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    fileprivate var panGestureRecognizer: UIPanGestureRecognizer!
    fileprivate var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    fileprivate var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    
    fileprivate var initialIndicatorViewFrame: CGRect?
    fileprivate var oldNearestIndex: Int!
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func add(cell: SPSegmentedControlCell) {
        cell.isUserInteractionEnabled = false
        self.cells.append(cell)
        self.addSubview(cell)
        self.selectedIndex = self.defaultSelectedIndex
    }
    
    func add(cells: [SPSegmentedControlCell]) {
        for cell in cells {
            cell.isUserInteractionEnabled = false
            self.cells.append(cell)
            self.addSubview(cell)
            self.selectedIndex = self.defaultSelectedIndex
        }
    }
    
    private func commonInit() {
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        
        self.indicatorView.backgroundColor = UIColor.white
        self.addSubview(indicatorView)
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SPSegmentedControl.pan(_:)))
        panGestureRecognizer.delegate = self
        addGestureRecognizer(panGestureRecognizer)
        
        leftSwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(SPSegmentedControl.leftSwipe(_:)))
        leftSwipeGestureRecognizer.delegate = self
        leftSwipeGestureRecognizer.direction = .left
        self.indicatorView.addGestureRecognizer(leftSwipeGestureRecognizer)
        
        rightSwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(SPSegmentedControl.rightSwipe(_:)))
        rightSwipeGestureRecognizer.delegate = self
        rightSwipeGestureRecognizer.direction = .right
        self.indicatorView.addGestureRecognizer(rightSwipeGestureRecognizer)
    }
    
    private func updateSelectedIndex(animated: Bool = false) {
        if self.styleDelegate != nil {
            for (index, cell) in self.cells.enumerated() {
                self.styleDelegate?.normalState?(segmentControlCell: cell, forIndex: index)
            }
            self.styleDelegate?.selectedState?(segmentControlCell: self.cells[self.selectedIndex], forIndex: self.selectedIndex)
        }
        
        SPAnimationSpring.animate(
            0.35,
            animations: {
                self.indicatorView.frame = self.cells[self.selectedIndex].frame
        }, delay: 0,
           spring: 1,
           velocity: 0.8,
           options: [.curveEaseOut]
        )
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()

        if isRoundedFrame {
            self.layer.cornerRadius = min(self.frame.width, self.frame.height) * self.roundedRelativeFactor
            self.indicatorView.layer.cornerRadius = self.layer.cornerRadius
        }
        
        if cells.isEmpty {
            return
        }
        
        let cellWidth = self.frame.width / CGFloat(self.cells.count)
        
        for (index, cell) in cells.enumerated() {
            cell.frame = CGRect.init(
                x: cellWidth * CGFloat(index),
                y: 0,
                width: cellWidth,
                height: self.frame.height
            )
        }
        
        self.indicatorView.frame = CGRect.init(
            x: 0, y: 0,
            width: cellWidth,
            height: self.frame.height
        )
        self.updateSelectedIndex(animated: true)
    }
    
    fileprivate func nearestIndexToPoint(point: CGPoint) -> Int {
        var distances = [CGFloat]()
        
        for cell in self.cells {
            distances.append(
                abs(point.x - cell.center.x)
            )
        }
        return Int(distances.index(of: distances.min()!)!)
    }
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex : Int?
        for (index, cell) in cells.enumerated() {
            if cell.frame.contains(location) {
                calculatedIndex = index
            }
        }
        if calculatedIndex != nil {
            self.selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        return false
    }
}

extension SPSegmentedControl: UIGestureRecognizerDelegate {
    
    func pan(_ gestureRecognizer: UIPanGestureRecognizer!) {
        switch gestureRecognizer.state {
        case .began:
            self.initialIndicatorViewFrame = self.indicatorView.frame
            self.oldNearestIndex = self.nearestIndexToPoint(point: self.indicatorView.center)
        case .changed:
            var frame = self.initialIndicatorViewFrame!
            frame.origin.x += gestureRecognizer.translation(in: self).x
            indicatorView.frame = frame
            if indicatorView.frame.origin.x < 0 {
                indicatorView.frame.origin.x = 0
            }
            if (indicatorView.frame.origin.x + indicatorView.frame.width > self.frame.width) {
                indicatorView.frame.origin.x = self.frame.width - indicatorView.frame.width
            }
            
            if (isUpdateToNearestIndexWhenDrag) {
                let nearestIndex = self.nearestIndexToPoint(point: self.indicatorView.center)
                if (self.oldNearestIndex != nearestIndex) && (styleDelegate != nil) {
                    self.oldNearestIndex = self.nearestIndexToPoint(point: self.indicatorView.center)
                    for (index, cell) in cells.enumerated() {
                        styleDelegate?.normalState?(segmentControlCell: cell, forIndex: index)
                    }
                    styleDelegate?.selectedState?(segmentControlCell: cells[nearestIndex], forIndex:nearestIndex)
                }
            }
            self.delegate?.indicatorViewRelativPosition?(
                position: self.indicatorView.frame.origin.x,
                onSegmentControl: self
            )
        case .ended, .failed, .cancelled:
            let translation = gestureRecognizer.translation(in: self).x
            if abs(translation) > (self.frame.width / CGFloat(self.cells.count) * 0.08) {
                if self.selectedIndex == self.nearestIndexToPoint(point: self.indicatorView.center) {
                    if translation > 0 {
                        selectedIndex = selectedIndex + 1
                    } else {
                        selectedIndex = selectedIndex - 1
                    }
                } else {
                    self.selectedIndex = self.nearestIndexToPoint(point: self.indicatorView.center)
                }
            } else {
                self.selectedIndex = self.nearestIndexToPoint(point: self.indicatorView.center)
            }
        default:
            break
        }
    }
    
    func leftSwipe(_ gestureRecognizer: UISwipeGestureRecognizer!) {
        switch gestureRecognizer.state {
        case.ended:
            self.selectedIndex = selectedIndex - 1
        default:
            break
        }
    }
    
    func rightSwipe(_ gestureRecognizer: UISwipeGestureRecognizer!) {
        switch gestureRecognizer.state {
        case.ended:
            self.selectedIndex = selectedIndex + 1
        default:
            break
        }
    }
    
    override open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == panGestureRecognizer {
            return indicatorView.frame.contains(gestureRecognizer.location(in: self))
        }
        return super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
}
