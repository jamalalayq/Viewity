//
//  LinearGradient.swift
//  
//
//  Created by Jamal alayq on 5/24/20.
//

import Foundation
import UIKit

public struct LinearGradient: Gradient {
    public var frame: CGRect = .zero
    public var colors: Array<UIColor>
    public var locations: Array<CGFloat>?
    public var startPoint: CGPoint = .init(x: 0.5, y: .zero)
    public var endPoint: CGPoint = .init(x: 0.5, y: 1.0)
    public private(set)var type: CAGradientLayerType = .axial

    public init(
        frame: CGRect = .zero,
        colors: Array<UIColor>,
        locations: Array<CGFloat>? = nil,
        startPoint: CGPoint = .init(x: 0.5, y: .zero),
        endPoint: CGPoint = .init(x: 0.5, y: 1.0)
    ) {
        self.frame = frame
        self.colors = colors
        self.endPoint = endPoint
        self.startPoint = startPoint
        self.locations = locations
    }
}
