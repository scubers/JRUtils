//
//  String+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation
import UIKit


public extension String {
    /**
     直接传入String，返回的就是c中的字符串指针 char *
     - parameter string: 字符串
     - returns: char *
     */
    public static func toCStringUnsafePointer(stringPointer: UnsafePointer<Int8>) -> UnsafePointer<Int8> {
        return stringPointer
    }
    
    
    public var jrcolor: UIColor? {
        let arr = self.componentsSeparatedByString(",").map {$0.trim()}
        if arr.count == 3 {
            return UIColor(red: CGFloat((arr[0] as NSString).floatValue)/255.0,
                           green: CGFloat((arr[1] as NSString).floatValue)/255.0,
                           blue: CGFloat((arr[2] as NSString).floatValue)/255.0,
                           alpha: 1)
        } else if arr.count == 4 {
            return UIColor(red: CGFloat((arr[0] as NSString).floatValue)/255.0,
                           green: CGFloat((arr[1] as NSString).floatValue)/255.0,
                           blue: CGFloat((arr[2] as NSString).floatValue)/255.0,
                           alpha: CGFloat((arr[3] as NSString).floatValue))
        }
        return nil
    }
    
    public func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    public var jrURL: NSURL? {
        return NSURL(string: self)
    }
}

