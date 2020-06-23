//
//  extentions.swift
//  iOS-Swift-DateTimeStringFormat
//
//  Created by Pooya on 2020-06-21.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

extension Date {
    func toString(fromFormat: String = "yyyy-MM-dd HH:mm:ss", toFromat: String = "dd-MMM-yyyy HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        let dateString = formatter.string(from: self)
        let againDate = formatter.date(from: dateString)
        formatter.dateFormat = toFromat
        let outputDate = formatter.string(from: againDate!)
        return outputDate
    }
    
    func addDayToDate(bytimes :Int = 0 ) -> Date {
        let nextDate : Date = Calendar.current.date(byAdding: .day, value: bytimes, to: self)!
        return nextDate
    }

    func addMinToDate(bytimes :Int = 0 ) -> Date {
        let nextDate : Date = Calendar.current.date(byAdding: .minute, value: bytimes, to: self)!
        return nextDate
    }

    func toTimeStamp() -> Double {
        return self.timeIntervalSince1970
    }
    
    
}


extension String {
    
    func toDate(byFormat : String = "yyyy-MM-dd HH:mm:ss ZZZ" , byZone : String = "") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = byFormat
        if byZone != "" {
            dateFormatter.timeZone = TimeZone(abbreviation: byZone) // "UTC"
        }
        let outdate = dateFormatter.date(from: self) ?? Date()
        return outdate
    }
    
    func addDayToDate(fromFormat : String = "yyyy-MM-dd HH:mm:ss", toFormat : String = "yyyy-MM-dd HH:mm:ss" , byTimes : Int = 0) -> String {
        let dateFormatterIN = DateFormatter()
        dateFormatterIN.dateFormat = fromFormat
        let stringDate = dateFormatterIN.date(from: self)!
        let nextDate : Date = Calendar.current.date(byAdding: .day, value: byTimes, to: stringDate)!
        let dateFormatterOUT = DateFormatter()
        dateFormatterOUT.dateFormat = toFormat
        let finalDate = dateFormatterOUT.string(from: nextDate)
        return finalDate
    }

    func addMinToDate(fromFormat : String = "yyyy-MM-dd HH:mm:ss", toFormat : String = "yyyy-MM-dd HH:mm:ss" , byTimes : Int = 0) -> String {
        let dateFormatterIN = DateFormatter()
        dateFormatterIN.dateFormat = fromFormat
        let stringDate = dateFormatterIN.date(from: self)!
        let nextDate : Date = Calendar.current.date(byAdding: .minute, value: byTimes, to: stringDate)!
        let dateFormatterOUT = DateFormatter()
        dateFormatterOUT.dateFormat = toFormat
        let finalDate = dateFormatterOUT.string(from: nextDate)
        return finalDate
    }

    func toTimeStamp(byFormat : String = "yyyy-MM-dd HH:mm:ss ZZZ" , byZone : String = "") -> Double {
        let thisdate = self.toDate(byFormat: byFormat, byZone: byZone)
        return thisdate.timeIntervalSince1970
    }
    
    
}
