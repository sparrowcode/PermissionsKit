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

extension UITableView {
    
    var isEmpty: Bool {
        return self.lastSectionWithRows == nil
    }
    
    func isEmpty(section: Int) -> Bool {
        return self.numberOfRows(inSection: section) == 0
    }
    
    var lastSection: Int {
        return self.numberOfSections - 1
    }
    
    var lastSectionWithRows: Int? {
        if self.numberOfSections == 0 { return nil }
        var section = self.numberOfSections - 1
        if section < 0 { return nil }
        while section >= 0 {
            if self.numberOfRows(inSection: section) != 0 { return section }
            section -= 1
        }
        return nil
    }
    
    var firstSectionWithRows: Int? {
        if self.numberOfSections == 0 { return nil }
        var section = 0
        if section > self.numberOfSections - 1 { return nil }
        while section <= (self.numberOfSections - 1) {
            if self.numberOfRows(inSection: section) != 0 { return section }
            section += 1
        }
        return nil
    }
}
