//
//  UIScrollView+ParallaxHeader.swift
//  U17
//
//  Created by 章建明 on 2022/8/9.
//

import Foundation
import UIKit
//import ObjectiveC.runtime



extension UIScrollView {
    private struct AssociatedKeys {
        static var descriptiveName = "AssociatedKeys.DescriptiveName.parallaxHeader"
    }
    
    //关联对象
    public var parallaxHeader: ParallaxHeader {
        get{
            if let header = objc_getAssociatedObject(self, &AssociatedKeys.descriptiveName) as? ParallaxHeader {
                return header
            }
            
            let header = ParallaxHeader()
            self.parallaxHeader = header
            return header
        }
        
        set(parallaxHeader) {
            parallaxHeader.scrollView = self
            objc_setAssociatedObject(self, &AssociatedKeys.descriptiveName, parallaxHeader, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
