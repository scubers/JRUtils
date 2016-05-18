//
//  UIView+jex.swift
//  JRUtils
//
//  Created by 王俊仁 on 16/5/9.
//  Copyright © 2016年 jrwong. All rights reserved.
//

import UIKit

public extension UIView {
    public var jr_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    public var jr_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }

    public var jr_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }

    public var jr_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    public var jr_maxX: CGFloat {
        get {
            return jr_width + jr_x
        }
    }
    public var jr_maxY: CGFloat {
        get {
            return jr_height + jr_y
        }
    }
    public var jr_centerX: CGFloat {
        get {
            return CGRectGetMidX(frame)
        }
        set {
            jr_x = newValue - (jr_width / 2)
        }
    }
    public var jr_centerY: CGFloat {
        get {
            return CGRectGetMidY(frame)
        }
        set {
            jr_y = newValue - (jr_height / 2)
        }
    }
}