//
//  Views+Gradients.swift
//  
//
//  Created by Jamal alayq on 5/24/20.
//

import Foundation
import UIKit

public extension UIView {

    /// Create gradient layer and add it to current view layers.
    /// - Parameter type: of gradients that prepared in advance.
    /// - Types:
    ///     * `LinearGradient`
    ///     * `CircularGradient`
    ///     * `AngularGradient`.
    ///     ---
    /// - Returns: new reference of current view.
    /// - Note:- Every time call this function creates new gradient layer.
    @discardableResult func gradient(of type: Gradient) -> Self {
        let gradient = CAGradientLayer()
        gradient.colors = type.colors.compactMap { $0.cgColor }
        gradient.locations = type.locations?.map(NSNumber.init)
        gradient.startPoint = type.startPoint
        gradient.endPoint = type.endPoint
        gradient.type = type.type
        gradient.frame = type.frame == .zero ? bounds : type.frame
        layer.insertSublayer(gradient, at: 0)
        return self
    }
}
