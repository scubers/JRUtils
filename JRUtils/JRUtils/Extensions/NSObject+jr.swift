//
//  NSObject+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

private var jr_discardBagKey = "jr_discardBagKey"

public extension NSObject {
    var jr_discardBag: DiscardBag {
        get {
            guard let bag = objc_getAssociatedObject(self, &jr_discardBagKey) else {
                let bag = DiscardBag()
                objc_setAssociatedObject(self, &jr_discardBagKey, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return bag
            }
            return bag as! DiscardBag
        }
    }
}

internal var jr_deallocatedKey = "jr_deallocatedKey"
extension NSObject {
    public func jr_deallocated(with block: dispatch_block_t) {
        self.jr_discardBag.block = block
    }
}