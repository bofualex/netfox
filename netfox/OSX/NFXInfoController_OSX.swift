//
//  NFXInfoController_OSX.swift
//  netfox
//
//  Copyright © 2016 netfox. All rights reserved.
//

#if os(OSX)
    
import Cocoa
    
class NFXInfoController_OSX: NFXInfoController {
    
    @IBOutlet weak var titleTextField: NSTextField!
    @IBOutlet weak var contentTextField: NSTextField!
    
    override func awakeFromNib() {
        self.titleTextField.stringValue = self.titleString()
        
        NFXDebugInfo.getNFXIP { (ipAddress) -> Void in
            DispatchQueue.main.async {
                self.contentTextField.attributedStringValue = self.macInfoString(withIPAddress: ipAddress)
            }
        }
    }

}

#endif
