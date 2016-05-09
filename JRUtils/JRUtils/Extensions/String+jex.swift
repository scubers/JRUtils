//
//  String+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import Foundation

public extension String {
    /**
     直接传入String，返回的就是c中的字符串指针 char *
     - parameter string: 字符串
     - returns: char *
     */
    public static func toCStringUnsafePointer(string: UnsafePointer<Int8>) -> UnsafePointer<Int8> {
        return string
    }
}