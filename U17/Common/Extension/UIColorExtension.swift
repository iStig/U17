//
//  UIColorExtension.swift
//  U17
//
//  Created by 章建明 on 2022/8/9.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r:UInt32, g:UInt32, b:UInt32, a:CGFloat = 1.0){
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: a)
    }
}
