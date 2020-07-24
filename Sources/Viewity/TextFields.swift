//
//  TextFields.swift
//  Viewity
//
//  Created by Jamal alayq on 5/18/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UITextField

// MARK:- Text fields

public extension UITextField {
    @discardableResult
    func placeholder(
        _ text: String,
        foreground color: UIColor = .lightGray,
        font: UIFont = .systemFont(ofSize: 17)
    ) -> Self {
        self.placeholder = text
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: color,
                .font: font
            ]
        )
        return self
    }

    @discardableResult
    func right(view: UIView, with mode: UITextField.ViewMode = .always) -> Self {
        rightViewMode = mode
        rightView = view
        return self
    }

    @discardableResult
    func right(mode: UITextField.ViewMode) -> Self {
        rightViewMode = mode
        return self
    }

    @discardableResult
    func left(view: UIView, with mode: UITextField.ViewMode = .always) -> Self {
        leftViewMode = mode
        leftView = view
        return self
    }

    @discardableResult
    func left(mode: UITextField.ViewMode) -> Self {
        leftViewMode = mode
        return self
    }

    @discardableResult func text(_ words: String) -> Self {
        self.text = words.trimmingCharacters(in: .whitespaces)
        return self
    }

    @discardableResult func alignment(_ value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }

    @discardableResult func foreground(_ value: UIColor) -> Self {
        self.textColor = value
        return self
    }

    @discardableResult func border(style: BorderStyle) -> Self {
        self.borderStyle = style
        return self
    }

    @discardableResult func font(_ typeface: UIFont) -> Self {
        self.font = typeface
        return self
    }

    @discardableResult func enabled(_ force: Bool) -> Self {
        self.isEnabled = force
        return self
    }

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
    func delegate(_ value: UITextFieldDelegate) -> Self {
        self.delegate = value
        return self
    }

    @discardableResult func content(type: UITextContentType) -> Self {
        textContentType = type
        return self
    }

    @discardableResult func isSecure(_ value: Bool) -> Self {
        isSecureTextEntry = value
        return self
    }

    @discardableResult func style(_ value: UITextField.BorderStyle) -> Self {
        borderStyle = value
        return self
    }

}
