//
//  Int+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

public extension Int {
    public func jr_times(f: (i: Int)->()) {
        for i in 1...self {
            f(i: i)
        }
    }
}