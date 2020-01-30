//
//  Styling.swift
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

}

// MARK:- Buttons

public extension UIButton {

    @discardableResult
    func icon(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        self.imageView?.contentMode = .scaleAspectFit
        let insets: UIEdgeInsets = .init(top: 1, left: 1, bottom: 1, right: 1)
        self.imageEdgeInsets = insets
        self.contentEdgeInsets = insets
        return self
    }

    @discardableResult
    func text(_ title: String, for state: UIControl.State = .normal) -> Self {
        setTitle(title, for: state)
        return self
    }

    @discardableResult
    func enabled(_ state: Bool) -> Self {
        isEnabled = state
        return self
    }

    @discardableResult
    func foreground(_ color: UIColor?, for state: UIControl.State = .normal) -> Self {
        UIView.animate(withDuration: 0.5) {
            self.setTitleColor(color, for: state)
        }
        return self
    }

    @discardableResult
    func target(in container: Any?, action: Selector, state: UIControl.Event = .touchUpInside) -> Self {
        addTarget(container, action: action, for: state)
        return self
    }

    @discardableResult
    func font(_ typeface: UIFont) -> Self {
        titleLabel?.font = typeface
        return self
    }

    @discardableResult
    func alignment(_ value: NSTextAlignment) -> Self {
        titleLabel?.textAlignment = value
        return self
    }

    @discardableResult
    func content(insets: UIEdgeInsets) -> Self {
        contentEdgeInsets = insets
        return self
    }

    @discardableResult
    func horizontalContent(alignment: ContentHorizontalAlignment) -> Self {
        contentHorizontalAlignment = alignment
        return self
    }

    @discardableResult
    func verticalContent(alignment: ContentVerticalAlignment) -> Self {
        contentVerticalAlignment = alignment
        return self
    }

    @discardableResult
    func icon(insets: UIEdgeInsets) -> Self {
        imageEdgeInsets = insets
        return self
    }

    @discardableResult
    func text(insets: UIEdgeInsets) -> Self {
        titleEdgeInsets = insets        
        return self
    }

}

// MARK:- Labels

public extension UILabel {

//    @IBInspectable
//    var insets: UIEdgeInsets = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8) {
//        didSet {
//            setNeedsDisplay()
//            invalidateIntrinsicContentSize()
//        }
//    }
//
//    override func drawText(in rect: CGRect) {
//        super.drawText(in: rect.inset(by: insets))
//    }

// override var intrinsicContentSize: CGSize { self.calculateContentSize(for: <#T##UIEdgeInsets#>) }
    
//    @discardableResult
//    func padding(_ value: UIEdgeInsets) -> Self {
//        intrinsicContentSize = calculateContentSize(for: value)
//        setNeedsDisplay()
//        invalidateIntrinsicContentSize()
//        return self
//    }

//    private func calculateContentSize(for insets: UIEdgeInsets) -> CGSize {
//        var contentSize = super.intrinsicContentSize
//        contentSize.height += (insets.top + insets.bottom)
//        contentSize.width += (insets.left + insets.right)
//        return contentSize
//    }

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

// MARK:- Text fields

public extension UITextField {

    @discardableResult
    func placeholder(_ text: String) -> Self {
        self.placeholder = text
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.lightGray
            ]
        )
        return self
    }

    @discardableResult
    func right(view: UIView) -> Self {
        rightView = view
        return self
    }

    @discardableResult
    func right(mode: UITextField.ViewMode) -> Self {
        rightViewMode = mode
        return self
    }

    @discardableResult
    func left(mode: UITextField.ViewMode) -> Self {
        leftViewMode = mode
        return self
    }

    @discardableResult
    func left(view: UIView) -> Self {
        leftView = view
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

 }

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

