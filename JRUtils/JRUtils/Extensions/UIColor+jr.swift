//
//  UIColor+jex.swift
//  JRUtils
//
//  Created by JMacMini on 16/5/10.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import UIKit

extension UIColor {
    public static func jr_randomColor() -> UIColor {
        func randomFloat() -> CGFloat {
            return CGFloat(arc4random_uniform(1000)) / 1000.0
        }
        return UIColor(red: randomFloat(), green: randomFloat(), blue: randomFloat(), alpha: randomFloat())
    }
    
    public static func jr_fullRgbaColor(r r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha:
            a)
    }
}