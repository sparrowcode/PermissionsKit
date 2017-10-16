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

import Foundation
import CoreSpotlight
import MobileCoreServices

struct SPSpotlight {
    
    static let domainIdentifier = "by.ivanvorobei.sparrow"
    
    static func addItem(identifier: String, title: String, description: String, addedData: Date? = nil, keywords: [String] = []) {
        if #available(iOS 9.0, *) {
            let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeMessage as String)
            
            attributeSet.title = title
            attributeSet.contentDescription = description
            attributeSet.keywords = keywords
            if addedData != nil {
                attributeSet.contentCreationDate = addedData!
            }
            
            let item = CSSearchableItem(uniqueIdentifier: "\(identifier)", domainIdentifier: SPSpotlight.domainIdentifier, attributeSet: attributeSet)
            
            CSSearchableIndex.default().indexSearchableItems([item]) { error in
                if let error = error {
                    print("SPSpotlight addItem error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    static func removeItem(identifier: String) {
        if #available(iOS 9.0, *) {
            CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: ["\(identifier)"]) { error in
                if let error = error {
                    print("SPSpotlight removeItem error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
