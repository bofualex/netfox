//
//  NFXStatisticsController_OSX.swift
//  netfox
//
//  Copyright © 2016 netfox. All rights reserved.
//

#if os(OSX)
    
import Cocoa
    
class NFXStatisticsController_OSX: NFXStatisticsController {
 
    @IBOutlet weak var statisticsTextField: NSTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        generateStatics()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(NFXGenericController.reloadData),
                                               name: NSNotification.Name(rawValue: "NFXReloadData"),
                                               object: nil)
    }
    
    override func reloadData() {
        super.reloadData()
        self.statisticsTextField.attributedStringValue = self.macReportString()
    }
}

#endif
