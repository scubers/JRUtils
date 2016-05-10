//
//  NSDate+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

private var jr_componentsKey: String = "jr_componentsKey"


public extension NSDate {
    
    public static var fmt_yyyy_MM_dd: String {
        get { return "yyyy-MM-dd"}
    }
    public static var fmt_yyyy_MM_dd_HH_mm_ss: String {
        get {return "yyyy-MM-dd HH:mm:ss"}
    }
    
    // MARK: - format and parse
    public func jr_format(format: String) -> String? {
        let f = NSDateFormatter()
        f.dateFormat = format
        return f.stringFromDate(self)
    }
    
    public class func jr_parse(string: String, with format: String) -> NSDate? {
        let f = NSDateFormatter()
        f.dateFromString(format)
        return f.dateFromString(string)
    }
    
    // MARK: - components
    public var jr_dateComponent: NSDateComponents {
        get {
            var components = objc_getAssociatedObject(self, &jr_componentsKey) as? NSDateComponents
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
                objc_setAssociatedObject(self, &jr_componentsKey, components, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return components!
        }
    }
    
    public var jr_year: Int {
        return jr_dateComponent.year
    }
    public var jr_month: Int {
        return jr_dateComponent.month
    }
    public var jr_day: Int {
        return jr_dateComponent.day
    }
    /**
     1:周日-----7：周六
     */
    public var jr_weekday: Int {
        return jr_dateComponent.weekday
    }
    public var jr_hour: Int {
        return jr_dateComponent.hour
    }
    public var jr_minute: Int {
        return jr_dateComponent.minute
    }
    public var jr_second: Int {
        return jr_dateComponent.second
    }
    public var jr_weekOfYear: Int {
        return jr_dateComponent.weekOfYear
    }
    public var jr_weekOfMonth: Int {
        return jr_dateComponent.weekOfMonth
    }
    
    public var jr_tomorrow: NSDate {
        get {
            return NSDate(timeInterval: 3600 * 24, sinceDate: self)
        }
    }
    public var jr_yesterday: NSDate {
        get {
            return NSDate(timeInterval: -3600 * 24, sinceDate: self)
        }
    }
    
    public var jr_isLeapYear: Bool {
        get {
            let year = self.jr_year
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