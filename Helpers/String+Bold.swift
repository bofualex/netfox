//
//  String+Bold.swift
//  netfox_ios
//
//  Created by Toderasco Ion on 08/11/2017.
//  Copyright © 2017 kasketis. All rights reserved.
//

import Foundation

#if os(OSX)
    import Cocoa
#else
    import UIKit
#endif
    
/*
 Set an segment of text partially bold
 Example:
 let attributedDescription = NSMutableAttributedString()
 attributedDescription.normalString(descriptionMessage)
 attributedDescription.boldString(patientFullName, withSize: 15)
 stateDescriptionLabel.attributedText = attributedDescription
 */
extension NSMutableAttributedString {
    @discardableResult func boldString(_ text: String, withSize size: CGFloat) -> NSMutableAttributedString {
        let attrs: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font : NSFont.boldSystemFont(ofSize: size)]
        let boldString = NSMutableAttributedString(string: text, attributes:attrs)
        self.append(boldString)
        return self
    }
    
    @discardableResult func normalString(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        self.append(normal)
        return self
    }
}
