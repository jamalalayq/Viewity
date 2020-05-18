//
//  Views.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIView

// MARK:- Public views

public extension UIView {

    @discardableResult
    func corners(_ radius: CGFloat = 8, style: CornerStyle = .all) -> Self {
        switch style {
            case .all:
                layer.maskedCorners = [
                    .layerMinXMinYCorner,
                    .layerMaxXMaxYCorner,
                    .layerMaxXMinYCorner,
                    .layerMinXMaxYCorner
            ]
            case .down:
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            case .left:
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            case .right:
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            case .up:
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            case .upLeftDownRight:
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
            case .upRightDownLeft:
                layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
            case .upLeft:
                layer.maskedCorners = .layerMinXMinYCorner
            case .downLeft:
                layer.maskedCorners = .layerMinXMaxYCorner
            case .upRight:
                layer.maskedCorners = .layerMaxXMinYCorner
            case .downRight:
                layer.maskedCorners = .layerMaxXMaxYCorner
        }
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }    

    @discardableResult
    func border(width: CGFloat, color: UIColor) -> Self {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        return self
    }

    @discardableResult
    func shadow(offset: UIOffset, color: UIColor, radius: CGFloat, opacity: Float) -> Self {
        layer.masksToBounds = false
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = .init(width: offset.horizontal, height: offset.vertical)
        layer.shadowOpacity = opacity
        return self
    }

    /// Change background color with animation.
    @discardableResult
    func background(_ color: UIColor?, animated: Bool = true) -> Self {
        if animated {
            UIView.animate(withDuration: 0.5) { self.backgroundColor = color }
        } else {
            self.backgroundColor = color
        }
        return self
    }

    @discardableResult
    func tint(_ color: UIColor) -> Self {
        tintColor = color
        return self
    }

    /// Set Hidden state with animations
    @discardableResult
    func hidden(_ hide: Bool) -> Self {
        UIView.animate(
            withDuration: 0.3,
            animations: {
                self.alpha = hide ? 0 : 1
        }) {  _ in
            self.isHidden = hide
        }
        return self
    }

    /// Set alpha with animations.
    @discardableResult
    func opacity(_ value: CGFloat) -> Self {
        UIView.animate(withDuration: 0.5) { self.alpha = value }
        return self
    }

    @discardableResult
    func userInteraction(enabled: Bool) -> Self {
        isUserInteractionEnabled = enabled
        return self
    }

    @discardableResult
    func semantic(content attribute: UISemanticContentAttribute) -> Self {
        semanticContentAttribute = attribute
        return self
    }

    @discardableResult
    func frame(_ value: CGRect) -> Self {
        frame = value
        return self
    }

    @discardableResult
    func bounds(_ value: CGRect) -> Self {
        bounds = value
        return self
    }

    @discardableResult
    func transform(_ value: CGAffineTransform) -> Self {
        transform = value
        return self
    }

    /// Pass new bool value to `clipsToBounds` attribute.
    /// - Parameter value: Boolean value with default true.
    /// - Returns: Instance of this view.
    @discardableResult
    func clip(_ value: Bool = true) -> Self {
        clipsToBounds = value
        return self
    }


}
