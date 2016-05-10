//
//  CGRect+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import UIKit

public extension CGRect {
    public var jr_centerX: CGFloat {
        get {
            return CGRectGetMidX(self)
        }
    }
    public var jr_centerY: CGFloat {
        get {
            return CGRectGetMidY(self)
        }
    }
    public var jr_center: CGPoint {
        get {
            return CGPointMake(jr_centerX, jr_centerY)
        }
    }
}