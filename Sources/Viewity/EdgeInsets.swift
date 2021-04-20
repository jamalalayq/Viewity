//
//  EdgeInsets.swift
//  
//
//  Created by Jamal alayq on 4/20/21.
//

import UIKit

public extension UIEdgeInsets {
    init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
    init(offset value: UIOffset) {
        self.init(top: value.vertical, left: value.horizontal, bottom: value.vertical, right: value.horizontal)
    }
}

internal extension UIEdgeInsets {
    static func padding(from bounds: CGRect) -> Self {
        let horizontal = CGFloat(bounds.size.width * 0.08)
        let vertical = CGFloat(bounds.size.height * 0.08)
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
