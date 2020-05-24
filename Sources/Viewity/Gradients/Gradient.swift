//
//  Gradient.swift
//  
//
//  Created by Jamal alayq on 5/24/20.
//

import Foundation
import UIKit

public protocol Gradient {
    var frame: CGRect { get set }
    var colors: Array<UIColor> { get set }
    var locations: Array<CGFloat>? { get set }
    var startPoint: CGPoint { get set }
    var endPoint: CGPoint { get set }
    var type: CAGradientLayerType { get }

    init(
        frame: CGRect,
        colors: Array<UIColor>,
        locations: Array<CGFloat>?,
        startPoint: CGPoint,
        endPoint: CGPoint
    )
}
