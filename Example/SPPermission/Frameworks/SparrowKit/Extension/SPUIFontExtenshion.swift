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

extension UIFont {
    
    static func system(weight: FontWeight, size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: self.weight(for: weight))
    }
    
    private static func weight(for weight: FontWeight) -> UIFont.Weight {
        switch weight {
        case .ultraLight:
            return UIFont.Weight.ultraLight
        case .light:
            return UIFont.Weight.light
        case .medium:
            return UIFont.Weight.medium
        case .regular:
            return UIFont.Weight.regular
        case .bold:
            return UIFont.Weight.bold
        case .demiBold:
            return UIFont.Weight.semibold
        case .heavy:
            return UIFont.Weight.heavy
        default:
            return UIFont.Weight.regular
        }
    }
    
    enum FontWeight {
        case regular
        case medium
        case light
        case ultraLight
        case heavy
        case bold
        case demiBold
        case none
    }
}
