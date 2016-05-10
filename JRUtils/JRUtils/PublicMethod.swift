//
//  PublicMethod.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//


// MARK: swift uses
import Foundation

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

// MARK: - GCD相关
public func jex_delay(seconds:Double, queue:dispatch_queue_t, block:dispatch_block_t) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC))), queue, block)
}



