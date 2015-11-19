//
//  UIColorExtension.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let g = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let b = CGFloat(arc4random()) / CGFloat(UInt32.max)

        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
