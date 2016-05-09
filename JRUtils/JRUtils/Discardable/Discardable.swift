//
//  Discardable.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

/**
 *  可被处理的
 */
public protocol Discardable {
    func discard()
}

/**
    集中处理包
 */
public class DiscardBag {

    lazy private var stuffs: [Discardable] = [Discardable]()

    func addDiscardable(obj: Discardable) {
        stuffs.append(obj)
    }

    deinit {
        let arr = stuffs
        dispatch_async(dispatch_get_global_queue(0, 0)) { 
            arr.forEach {$0.discard()}
        }
    }
}