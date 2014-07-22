//
//  Date.swift
//  Jad's CV
//
//  Created by Jad Osseiran on 22/07/2014.
//  Copyright (c) 2014 Jad. All rights reserved.
//

import Foundation

extension NSDate {
    func stringFromFormatter(formatter: ((NSDateFormatter) -> Void)!) -> String {
        struct FormatterSingleton {
            static let dateFormatter: NSDateFormatter = NSDateFormatter()
        }
        
        if formatter {
            formatter(FormatterSingleton.dateFormatter)
        }
        
        return FormatterSingleton.dateFormatter.stringFromDate(self)
    }
    
    func condensedDescription() -> String {
        return stringFromFormatter() { formatter in
            formatter.dateFormat = "MMM YY"
        }
    }
    
    func combinedCondensedStringWithEndDate(endDate: NSDate, withSeparator separator: String) -> String {
        let startDateText = self.condensedDescription()
        
        //FIXME: I should not have to include NSComparisonResult here 
        if endDate.compare(NSDate.date()) == NSComparisonResult.OrderedDescending {
            return startDateText + separator + "Present"
        } else {
            let endDateText = endDate.condensedDescription()
            if startDateText == endDateText {
                return startDateText
            } else {
                return startDateText + separator + endDateText
            }
        }
    }
}