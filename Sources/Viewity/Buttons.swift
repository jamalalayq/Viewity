//
//  Buttons.swift
//  Viewity
//
//  Created by Jamal alayq on 5/18/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIButton

public class Button: UIButton {
    public typealias BasicHandler = () -> Void
    private var tappingHandler: BasicHandler?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        addTarget(self, action: #selector(clickAction), for: .touchUpInside)
    }

    @objc private func clickAction() {
        tappingHandler?()
    }

    public func onTap(_ handler: BasicHandler?) {
        self.tappingHandler = handler
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
