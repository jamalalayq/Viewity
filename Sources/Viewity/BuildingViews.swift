//
//  BuildingViews.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIView

public extension UIView {
    /// Set views in view
    /// - Parameter views: bunch of subview to add them in super view
    @discardableResult
    func add(_ views: UIView...) -> Self {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        return self
    }

    /// Fill view in super view
    /// - Parameters:
    ///   - margin: refer to insets
    ///   - directionRespect: refer to views directions
    @discardableResult
    func fill(_ margin: UIEdgeInsets = .zero, _ directionRespect: RespectDirection = .respect) -> Self? {
        precondition(superview != nil, "Must add target view in a container view.")
        guard case let .some(container) = superview else { return nil }
        topAnchor.constraint(equalTo: container.topAnchor, constant: margin.top)
            .isActive = true
        bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -margin.bottom)
            .isActive = true
        switch directionRespect {
            case .unrespect:
                leftAnchor.constraint(equalTo: container.leftAnchor, constant: margin.left)
                    .isActive = true
                rightAnchor.constraint(equalTo: container.rightAnchor, constant: -margin.right)
                    .isActive = true
            case .respect:
                leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: margin.left)
                    .isActive = true
                trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -margin.right)
                    .isActive = true
        }
        return self
    }

    /// Set view in middle
    @discardableResult
    func putInCenter(_ margin: AxisMargin = .zero) -> Self {
        precondition(superview != nil, "Must add target view in a container view.")
        guard case .some(let container) = superview else { return self }
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: margin.x),
            centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: margin.y)
        ])
        return self
    }

    @discardableResult
    func putInCenter(at axis: NSLayoutConstraint.Axis, _ margin: CGFloat = 0.0) -> Self {
        precondition(superview != nil, "Must add target view in a container view.")
        guard case .some(let container) = superview else { return self }
        switch axis {
            case .horizontal:
                centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: margin).isActive = true
            case .vertical:
                centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: margin).isActive = true
            @unknown default:
                print(#function, "can't set constraint")
                break
        }
        return self
    }

    @discardableResult
    func setDimensions(_ dimensions: CGSize) -> Self {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: dimensions.width),
            heightAnchor.constraint(equalToConstant: dimensions.height)
        ])
        return self
    }

    @discardableResult
    func equal(a d1: Dimensions, to d2: NSLayoutDimension, _ accessories: Accessories = .zero) -> Self {
        switch d1 {
            case .width:
                widthAnchor.constraint(equalTo: d2, multiplier: accessories.multiplier, constant: accessories.constant).isActive = true
            case .height:
                heightAnchor.constraint(equalTo: d2, multiplier: accessories.multiplier, constant: accessories.constant).isActive = true
        }
        return self
    }

    /// Set right or left constraints
    @discardableResult
    func align(a axis: HorizontalAxis, to a: NSLayoutXAxisAnchor, _ constant: CGFloat = 0.0) -> Self {
        switch axis {
            case .right:
                rightAnchor.constraint(equalTo: a, constant: -constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: a, constant: constant).isActive = true
            case .trailing:
                trailingAnchor.constraint(equalTo: a, constant: -constant).isActive = true
            case .leading:
                leadingAnchor.constraint(equalTo: a, constant: constant).isActive = true
        }
        return self
    }

    @discardableResult
    func align(a axis: VerticalAxis, to a: NSLayoutYAxisAnchor, _ constant: CGFloat = 0.0) -> Self {
        switch axis {
            case .top:
                topAnchor.constraint(equalTo: a, constant: constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: a, constant: -constant).isActive = true
        }
        return self
    }

    /// Set one dimension
    @discardableResult
    func setDimensions(_ dimensionType: Dimensions, _ size: CGFloat) -> Self {
        switch dimensionType {
            case .height:
                heightAnchor.constraint(equalToConstant: size).isActive = true
            case .width:
                widthAnchor.constraint(equalToConstant: size).isActive = true
        }
        return self
    }

}

