//
//  Exeptions.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIStackView

// MARK:- STACK VIEWS

public extension UIStackView {

    @discardableResult
    func addArranged(_ views: UIView...) -> Self {
        views.forEach(addArrangedSubview)
        return self
    }

    @discardableResult
    func removeArranged(subview: UIView) -> Self {
        removeArrangedSubview(subview)
        return self
    }

    @discardableResult
    func removeArranged(views: UIView...) -> Self {
        views.forEach(removeArrangedSubview)
        return self
    }

    @discardableResult
    func insert(subview: UIView, at index: Int) -> Self {
        insertArrangedSubview(subview, at: index)
        return self
    }

    @discardableResult
    func axis(_ value: NSLayoutConstraint.Axis) -> Self {
        axis = value
        return self
    }

    @discardableResult
    func distribution(_ value: UIStackView.Distribution) -> Self {
        distribution = value
        return self
    }

    @discardableResult
    func alignment(_ value: UIStackView.Alignment) -> Self {
        alignment = value
        return self
    }

    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        spacing = value
        return self
    }

}
