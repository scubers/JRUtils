//
//  NSObject+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

private var key = "jex_discardBag"

public extension NSObject {
    var jex_discardBag: DiscardBag {
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            guard let bag = objc_getAssociatedObject(self, &key) else {
                let bag = DiscardBag()
                objc_setAssociatedObject(self, &key, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return bag
            }
            return bag as! DiscardBag
        }
    }
}