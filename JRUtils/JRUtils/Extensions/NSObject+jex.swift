//
//  NSObject+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

private var jex_discardBagKey = "jex_discardBagKey"

public extension NSObject {
    var jex_discardBag: DiscardBag {
        get {
            guard let bag = objc_getAssociatedObject(self, &jex_discardBagKey) else {
                let bag = DiscardBag()
                objc_setAssociatedObject(self, &jex_discardBagKey, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return bag
            }
            return bag as! DiscardBag
        }
    }
}

internal var jex_deallocatedKey = "jex_deallocatedKey"
extension NSObject {
    public func jex_deallocated(with block: dispatch_block_t) {
        self.jex_discardBag.block = block
    }
}