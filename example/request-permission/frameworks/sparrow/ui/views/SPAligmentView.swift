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

class SPAligmentView: UIView {
    
    var minSpace: CGFloat = 0
    var maxItemSideSize: CGFloat?
    var spaceFactor: CGFloat = 0.07
    var aliment: Aliment
    
    required init?(coder aDecoder: NSCoder) {
        self.aliment = .vertical
        super.init(coder: aDecoder)
    }
    
    init(aliment: Aliment) {
        self.aliment = aliment
        super.init(frame: CGRect.zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let countViews: CGFloat = CGFloat(self.subviews.count)
        
        var itemWidth: CGFloat = 0
        var itemHeight: CGFloat = 0
        var space: CGFloat = 0
        
        switch self.aliment {
        case .horizontal:
            itemHeight = self.frame.height
            space = self.frame.width * self.spaceFactor
            if space < self.minSpace {
                space = self.minSpace
            }
            let spaceForButton = self.frame.width - (space * (countViews - 1))
            itemWidth = spaceForButton / countViews
            if self.maxItemSideSize != nil {
                if (itemWidth > self.maxItemSideSize!) {
                    itemWidth = self.maxItemSideSize!
                    if countViews > 1 {
                        space = (self.frame.width - (itemWidth * countViews)) / (countViews - 1)
                    } else {
                        space = 0
                    }
                }
            }
        case .vertical:
            itemWidth = self.frame.width
            space = self.frame.height * self.spaceFactor
            if space < self.minSpace {
                space = self.minSpace
            }
            let spaceForButton = self.frame.height - (space * (countViews - 1))
            itemHeight = spaceForButton / countViews
            if self.maxItemSideSize != nil {
                if (itemHeight > self.maxItemSideSize!) {
                    itemHeight = self.maxItemSideSize!
                    if countViews > 1 {
                        space = (self.frame.height - (itemHeight * countViews)) / (countViews - 1)
                    } else {
                        space = 0
                    }
                }
            }
        }
        
        var xPoint: CGFloat = 0
        var yPoint: CGFloat = 0
        for (index, view) in self.subviews.enumerated() {
            switch self.aliment {
            case .horizontal:
                xPoint = CGFloat(index) * (itemWidth + space)
            case .vertical:
                yPoint = CGFloat(index) * (itemHeight + space)
            }
            view.frame = CGRect.init(
                x: xPoint, y: yPoint,
                width: itemWidth,
                height: itemHeight
            )
        }
    }
    
    enum Aliment {
        case vertical
        case horizontal
    }
}

class SPCenteringAligmentView: SPAligmentView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.subviews.count == 0 {
            return
        }
        var itemHeight: CGFloat = self.subviews[0].frame.height
        var itemWidth: CGFloat = self.subviews[0].frame.width
        let countViews: CGFloat = CGFloat(self.subviews.count)
        
        if countViews < 3 {
            switch self.aliment {
            case .horizontal:
                switch self.subviews.count {
                case 1:
                    self.subviews[0].center.x = self.frame.width / 2
                case 2:
                    let allFreeSpace = self.frame.width - (itemWidth * countViews)
                    var space = allFreeSpace / 2
                    if space < self.minSpace {
                        space = self.minSpace
                        itemWidth = (self.frame.width - (space * 2)) / 2
                    }
                    self.subviews[0].frame = CGRect.init(x: space / 2, y: self.subviews[0].frame.origin.y, width: itemWidth, height: self.subviews[0].frame.height)
                    self.subviews[1].frame = CGRect.init(x: space / 2 + itemWidth + space, y: self.subviews[1].frame.origin.y, width: itemWidth, height: self.subviews[1].frame.height)
                default:
                    break
                }
            case .vertical:
                switch self.subviews.count {
                case 1:
                    self.subviews[0].center.y = self.frame.height / 2
                case 2:
                    let allFreeSpace = self.frame.height - (itemHeight * countViews)
                    var space = allFreeSpace / 2
                    if space < self.minSpace {
                        space = self.minSpace
                        itemHeight = (self.frame.height - (space * 2)) / 2
                    }
                    self.subviews[0].frame = CGRect.init(x: self.subviews[0].frame.origin.x, y: space / 2, width: self.subviews[0].frame.width, height: itemHeight)
                    self.subviews[1].frame = CGRect.init(x: self.subviews[1].frame.origin.x, y: (space / 2) + itemHeight + space, width: self.subviews[1].frame.width, height: itemHeight)
                default:
                    break
                }
            }
        }
    }
}

class SPDinamicAligmentView: UIView {
    
    var aliment: Aliment
    
    var itemSideSize: CGFloat = 50
    var space: CGFloat = 10
    
    var needSize: CGSize {
        get {
            self.layoutSubviews()
            switch aliment {
            case .horizontal:
                return CGSize.init(width: ((self.subviews.last?.frame.origin.x) ?? 0) + ((self.subviews.last?.frame.width) ?? 0), height: (self.subviews.last?.frame.height) ?? 0)
            case .vertical:
                return CGSize.init(width: (self.subviews.last?.frame.width) ?? 0, height: (self.subviews.last?.frame.bottomYPosition) ?? 0)
            }
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.aliment = .vertical
        super.init(coder: aDecoder)
    }
    
    init(aliment: Aliment) {
        self.aliment = aliment
        super.init(frame: CGRect.zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var xPoint: CGFloat = 0
        var yPoint: CGFloat = 0
        var itemWidth: CGFloat = 0
        var itemHeight: CGFloat = 0
        
        for (index, view) in self.subviews.enumerated() {
            switch self.aliment {
            case .horizontal:
                xPoint = CGFloat(index) * (self.itemSideSize + space)
                itemWidth = self.itemSideSize
                itemHeight = self.frame.height
            case .vertical:
                yPoint = CGFloat(index) * (self.itemSideSize + space)
                itemWidth = self.frame.width
                itemHeight = self.itemSideSize
            }
            view.frame = CGRect.init(
                x: xPoint, y: yPoint,
                width: itemWidth,
                height: itemHeight
            )
        }
        
        var needSideSize: CGFloat = 0
        let lastView = self.subviews.last
        if lastView != nil {
            switch self.aliment {
            case .horizontal:
                needSideSize = lastView!.frame.origin.x + lastView!.frame.width
                self.setWidth(needSideSize)
                break
            case .vertical:
                needSideSize = lastView!.frame.origin.y + lastView!.frame.height
                self.setHeight(needSideSize)
                break
            }
        }
    }
    
    enum Aliment {
        case vertical
        case horizontal
    }

}
