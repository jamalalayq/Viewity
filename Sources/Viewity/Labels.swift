//
//  Labels.swift
//  Viewity
//
//  Created by Jamal alayq on 5/18/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UILabel

public class Label: UILabel {

    @IBInspectable
    public var insets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8) {
        didSet {
            setNeedsDisplay()
            invalidateIntrinsicContentSize()
        }
    }

    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    public override var intrinsicContentSize: CGSize { self.calculateContentSize(for: insets) }

    @discardableResult
    public func padding(_ value: UIEdgeInsets) -> Self {
        insets = value
        return self
    }

    private func calculateContentSize(for insets: UIEdgeInsets) -> CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += (insets.top + insets.bottom)
        contentSize.width += (insets.left + insets.right)
        return contentSize
    }
}


// MARK:- Labels

public extension UILabel {
    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func font(_ typeface: UIFont) -> Self {
        self.font = typeface
        return self
    }

    @discardableResult
    func foreground(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func alignment(_ align: NSTextAlignment) -> Self {
        self.textAlignment = align
        return self
    }

    @discardableResult
    func number(ofLines value: Int) -> Self {
        numberOfLines = value
        return self
    }

    @discardableResult
    func fitToWidth(_ scale: CGFloat = 0.5) -> Self {
        minimumScaleFactor = scale
        adjustsFontSizeToFitWidth = true
        return self
    }

}
