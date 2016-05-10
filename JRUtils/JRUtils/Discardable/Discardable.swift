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
@objc
public protocol Discardable {
    func discard()
    optional func addToDiscardBag(bag: DiscardBag)
}

extension Discardable {
    public func addToDiscardBag(bag: DiscardBag) {
        bag.addDiscardable(self)
    }
}

/**
 集中处理包
 */
@objc
public class DiscardBag : NSObject {
    
    lazy public var stuffs: [Discardable?] = [Discardable?]()
    internal var block: dispatch_block_t?
    
    public func addDiscardable(obj: Discardable) {
        stuffs.append(obj)
    }
    
    deinit {
        block?()
        let arr = stuffs
        dispatch_async(dispatch_get_main_queue()) {
            arr.forEach {$0?.discard()}
        }
    }
}