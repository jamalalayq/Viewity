//
//  GeneralUsage.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIView

public extension UIView {
    typealias AxisMargin = CGPoint

    enum Dimensions {
        case width, height
    }

    enum HorizontalAxis {
        case right, left, leading, trailing
    }

    enum VerticalAxis {
        case top, bottom
    }

    enum RespectDirection {
        case respect, unrespect
    }

    struct Accessories {
        public let multiplier: CGFloat
        public let constant: CGFloat

        public static var zero: Accessories {
            return Accessories(multiplier: 1.0, constant: 0)
        }

    }

    enum CornerStyle {
        case all, up, down, right, left, upLeftDownRight, upRightDownLeft
        case upLeft, downLeft, upRight, downRight
    }

}


internal protocol Naming { }
internal extension Naming {
    func name(of object: AnyClass) -> String { .init(describing: object) }
}

public enum Light {
    case on, off
}
