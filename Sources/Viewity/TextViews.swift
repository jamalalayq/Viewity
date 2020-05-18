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
    func foreground(_ value: UIColor) -> Self {
        self.textColor = value
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

}

