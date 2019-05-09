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

class SPPlayCircleButton: UIButton {
    
    var audioState: AudioState = AudioState.play {
        didSet {
            switch self.audioState {
            case .play:
                self.iconView.type = .play
                break
            case .pause:
                self.iconView.type = .pause
                break
            case .stop:
                self.iconView.type = .stop
                break
            }
        }
    }
    
    var iconColor = SPNativeColors.white {
        didSet {
            self.iconView.color = self.iconColor
        }
    }
    
    let iconView = SPAudioIconView.init()
    
    init() {
        super.init(frame: CGRect.zero)
        self.addSubview(self.iconView)
        self.iconView.isUserInteractionEnabled = false
        self.setTitle("", for: .normal)
        self.backgroundColor = SPNativeColors.blue
        self.audioState = .play
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.iconView.setBounds(self, withWidthFactor: 0.45, withHeightFactor: 0.45, withCentering: true)
        self.round()
    }
    
    enum AudioState {
        case play
        case pause
        case stop
    }
}

