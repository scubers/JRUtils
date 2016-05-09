//
//  PublicMethod.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//


import Foundation
import UIKit

/**
 *用来替代swift中无法直接使用大括号
 */
public func jex_block(@noescape closure: Void->Void) {
    closure()
}

public func jex_example(description:String? = "", @noescape closure:Void->Void) {
    print("-----------\(description)------------")
    closure()
}

/**
 将一个已知类型转成Optional类型
 */
public func jex_optional<T>(obj:T) -> T? {
    let t : T? = obj
    return t
}

/**
 直接获取某个对象（不可变）的指针
 */
public func jex_pointer<T>(inout obj: T) -> UnsafePointer<T> {
    return withUnsafePointer(&obj) { (pointer) -> UnsafePointer<T> in
        return pointer
    }
}

/**
 直接获取某个对象（可变）的指针
 */
public func jex_mutablePointer<T>(inout obj: T) -> UnsafeMutablePointer<T> {
    return withUnsafeMutablePointer(&obj) { (pointer) -> UnsafeMutablePointer<T> in
        return pointer
    }
}

public func jr_notNil(string: String?) -> String {
    return string ?? ""
}


/**
 *颜色的方便方法
 */
public func jex_rgbaColor(r r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor? {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


/**
 *随机颜色
 */
public func jex_randomColor() -> UIColor? {
    func randomFloat() -> CGFloat {
        return CGFloat(arc4random_uniform(1000)) / 1000.0
    }
    return UIColor(red: randomFloat(), green: randomFloat(), blue: randomFloat(), alpha: randomFloat())
}

/**
 *获取包版本
 */
public func jex_bundleVersion() -> String? {
    return (NSBundle.mainBundle().infoDictionary?["CFBundleVersion"])! as? String;
}

/**
 *系统版本 ios7.8.9
 */
public func jex_systemVersion() -> Double {
    return Double(UIDevice.currentDevice().systemVersion)!
}

// MARK: - 路径
public func jex_documentsDirectory() -> String {
    return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
}
public func jex_libraryDirectory() -> String {
    return NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true).first!
}
public func jex_cacheDirectory() -> String {
    return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
}

// 工具
public func jex_uuid() -> String {
    let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
    let string = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
    return string as String
}

// MARK: - GCD相关
public func jex_delay(seconds:Double, queue:dispatch_queue_t, block:dispatch_block_t) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC))), queue, block)
}



