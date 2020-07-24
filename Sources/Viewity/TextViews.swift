//
//  TextViews.swift
//  Viewity
//
//  Created by Jamal alayq on 5/18/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UITextView


// MARK:- Text views

public extension UITextView {

    @discardableResult
    func unfocus() -> Self {
        resignFirstResponder()
        return self
    }

    @discardableResult
    func focus() -> Self {
        becomeFirstResponder()
        return self
    }

    @discardableResult
    func font(_ typeface: UIFont) -> Self {
        self.font = typeface
        return self
    }

    @discardableResult
    func editable(_ value: Bool) -> Self {
        isEditable = value
        return self
    }

    @discardableResult
    func text(_ words: String) -> Self {
        self.text = words.trimmingCharacters(in: .newlines)
        return self
    }

    @discardableResult
    func alignment(_ value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }

    @discardableResult
    func foreground(color: UIColor) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func selectable(_ value: Bool) -> Self {
        isSelectable = value
        return self
    }

    @discardableResult
    func delegate(_ value: UITextViewDelegate) -> Self {
        self.delegate = value
        return self
    }

    @discardableResult func padding(_ insets: UIEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)) -> Self {
        textContainerInset = insets
        return self
    }

    @discardableResult func padding(_ offset: UIOffset) -> Self {
        padding(.init(top: offset.vertical, left: offset.horizontal, bottom: offset.vertical, right: offset.horizontal))
    }

    @discardableResult func padding(_ value: CGFloat) -> Self {
        padding(UIEdgeInsets(top: value, left: value, bottom: value, right: value))
    }

}

open class TextView: UITextView, UITextViewDelegate {
    public var hintColor: UIColor = .lightGray { didSet { setNeedsDisplay() } }
    public var hint: String = "" { didSet { setNeedsDisplay() } }
    public var foregroundColor: UIColor = .darkText { didSet { setNeedsDisplay() } }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        if foregroundColor != hintColor {
            delegate = self
            if text.isEmpty {
                text = hint
                textColor = hintColor
            } else {
                textColor = foregroundColor
            }
        }
    }

    public var value: String? { text == hint ? nil : text }

    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == hint && textView.textColor == hintColor {
            textView.text = ""
            textView.textColor = foregroundColor
        }
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = hint
            textView.textColor = hintColor
        } else {
            textView.textColor = foregroundColor
        }
    }
}
