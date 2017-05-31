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

public extension UIFont {
    
    public struct fonts {
    
        public static func AvenirNext(type: BoldType, size: CGFloat) -> UIFont {
            return UIFont.createFont(.AvenirNext, boldType: type, size: size)
        }
    }
    
    public static func createFont(_ fontType: FontType, boldType: BoldType, size: CGFloat) -> UIFont {
        return UIFont.init(
            name: self.getFontNameBy(fontType: fontType) + self.getBoldTypeNameBy(boldType: boldType),
            size: size
            )!
    }
    
    private static func getFontNameBy(fontType: FontType) -> String {
        switch fontType {
        case .AvenirNext:
            return "AvenirNext"
        }
    }
    
    private static func getBoldTypeNameBy(boldType: BoldType) -> String {
        switch boldType {
        case .UltraLight:
            return "-UltraLight"
        case .Light:
            return "-Light"
        case .Medium:
            return "-Medium"
        case .Regular:
            return "-Regular"
        case .Bold:
            return "-Bold"
        case .DemiBold:
            return "-DemiBold"
        default:
            return "-Regular"
        }
    }
    
    public enum FontType {
        case AvenirNext
    }
    
    public enum BoldType {
        case Regular
        case Medium
        case Light
        case UltraLight
        case Bold
        case DemiBold
        case None
    }
}
