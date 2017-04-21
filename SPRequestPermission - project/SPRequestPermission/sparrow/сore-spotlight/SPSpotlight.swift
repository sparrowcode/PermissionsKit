//
//  File.swift
//  ExchangeRates
//
//  Created by Ivan Vorobei on 3/18/17.
//  Copyright © 2017 Ivan Vorobei. All rights reserved.
//

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
