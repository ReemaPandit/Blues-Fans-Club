//
//  File.swift
//  BluesFansClub
//
//  Created by Aryabhata I on 13/07/17.
//  Copyright © 2017 Aryabhata I. All rights reserved.
//

import Foundation

class fixturesItems :NSObject
{
    var datetime :String = ""
    var teamhome :String = ""
    var teamaway :String = ""
    var leaguename :String = ""
    var score :String = ""

    
}
//
//extension NSDate
//{
//    // Convert UTC (or GMT) to local time
//    func toLocalTime() -> NSDate {
//        let timezone: NSTimeZone = NSTimeZone.local as NSTimeZone
//        let seconds: TimeInterval = TimeInterval(timezone.secondsFromGMT(for: self as Date))
//        return NSDate(timeInterval: seconds, since: self as Date)
//    }
//    
//    // Convert local time to UTC (or GMT)
//    func toGlobalTime() -> NSDate {
//        let timezone: NSTimeZone = NSTimeZone.local as NSTimeZone
//        let seconds: TimeInterval = -TimeInterval(timezone.secondsFromGMT(for: self as Date))
//        return NSDate(timeInterval: seconds, since: self as Date)
//    }
//}

