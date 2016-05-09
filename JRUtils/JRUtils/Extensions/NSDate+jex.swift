//
//  NSDate+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

private var jex_componentsKey: String = "jex_componentsKey"

public let yyyy_MM_dd: String = "yyyy-MM-dd"
public let yyyy_MM_dd_HH_mm_ss: String = "yyyy-MM-dd HH:mm:ss"

public extension NSDate {

    // MARK: - format and parse
    public func jex_format(format: String) -> String? {
        let f = NSDateFormatter()
        f.dateFormat = format
        return f.stringFromDate(self)
    }

    public class func jex_parse(string: String, with format: String) -> NSDate? {
        let f = NSDateFormatter()
        f.dateFromString(format)
        return f.dateFromString(string)
    }

    // MARK: - components
    public var jex_dateComponent: NSDateComponents {
        get {
            var components = objc_getAssociatedObject(self, &jex_componentsKey) as? NSDateComponents
            if components == nil {
                components = NSCalendar.currentCalendar().components(
                    [
                        .Year,
                        .Month,
                        .Day,
                        .Weekday,
                        .Hour,
                        .Minute,
                        .Second,

                        .WeekOfYear,
                        .WeekOfMonth,
                    ], fromDate: self)
                objc_setAssociatedObject(self, &jex_componentsKey, components, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return components!
        }
    }

    public var jex_year: Int {
        return jex_dateComponent.year
    }
    public var jex_month: Int {
        return jex_dateComponent.month
    }
    public var jex_day: Int {
        return jex_dateComponent.day
    }
    /**
     1:周日-----7：周六
     */
    public var jex_weekday: Int {
        return jex_dateComponent.weekday
    }
    public var jex_hour: Int {
        return jex_dateComponent.hour
    }
    public var jex_minute: Int {
        return jex_dateComponent.minute
    }
    public var jex_second: Int {
        return jex_dateComponent.second
    }
    public var jex_weekOfYear: Int {
        return jex_dateComponent.weekOfYear
    }
    public var jex_weekOfMonth: Int {
        return jex_dateComponent.weekOfMonth
    }

    public var jex_tomorrow: NSDate {
        get {
            return NSDate(timeInterval: 3600 * 24, sinceDate: self)
        }
    }
    public var jex_yesterday: NSDate {
        get {
            return NSDate(timeInterval: -3600 * 24, sinceDate: self)
        }
    }

    public var jex_isLeapYear: Bool {
        get {
            let year = self.jex_year
            if year % 400 == 0 {
                return true
            } else {
                return (year % 4 == 0 && year % 100 != 0)
            }
        }
    }


    // MARK: - method
    public func isEarlyThan(date: NSDate) -> Bool {
        return self.compare(date) == .OrderedAscending
    }
    public func isLaterThan(date: NSDate) -> Bool {
        return self.compare(date) == .OrderedDescending
    }


}