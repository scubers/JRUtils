//
//  JRUtils.swift
//  JRUtils
//
//  Created by JMacMini on 16/5/10.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import UIKit

public class JRUtil : NSObject {
    // MARK: - 工具
    public class func uuid() -> String {
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        let string = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
        return string as String
    }
    // MARK: - 路径
    public var documentsDirectory: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        }
    }
    public var libraryDirectory: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first!
        }
    }
    public var cacheDirectory: String {
        get {
            return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        }
    }
    // MARK: - 信息
    public var bundleVersion: String? {
        get {
            return (NSBundle.mainBundle().infoDictionary?["CFBundleVersion"])! as? String;
        }
    }
    public var systemVersion: Double {
        get {
            return Double(UIDevice.currentDevice().systemVersion)!
        }
    }


}