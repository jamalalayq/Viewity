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

    enum PaddingAxis {
        case vertical, horizontal, all
    }

}

internal extension UIEdgeInsets {
    static func padding(from bounds: CGRect) -> Self {
        let horizontal = CGFloat(bounds.size.width * 0.08)
        let vertical = CGFloat(bounds.size.height * 0.08)
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}

public class TextField: UITextField {
    private lazy var padding: UIEdgeInsets = .padding(from: self.bounds)

    @discardableResult public func padding(_ offset: UIOffset) -> Self {
        padding = .init(top: offset.vertical, left: offset.horizontal, bottom: offset.vertical, right: offset.horizontal)
        return self
    }

    @discardableResult public func padding(_ insets: UIEdgeInsets) -> Self {
        padding = insets
        return self
    }

    @discardableResult public func padding(_ value: CGFloat, _ direction: UITextField.PaddingAxis = .all) -> Self {
        switch direction {
            case .all:
                return padding(UIEdgeInsets(top: value, left: value, bottom: value, right: value))
            case .horizontal:
                return padding(UIEdgeInsets(top: .zero, left: value, bottom: .zero, right: value))
            case .vertical:
                return padding(UIEdgeInsets(top: value, left: .zero, bottom: value, right: .zero))
        }
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

}
