//
//  Applications.swift
//  
//
//  Created by Jamal alayq on 5/27/20.
//

import UIKit.UIApplication

public extension UIApplication {
    /// Activate idle timer to turn off screen if no touches.
    @discardableResult func idleScreen() -> Self {
        isIdleTimerDisabled = false
        return self
    }

    /// Disable idle timer to turn on screen permanently.
    @discardableResult func activeScreen() -> Self {
        isIdleTimerDisabled = true
        return self
    }

    @discardableResult func add(shortcut item: UIApplicationShortcutItem) -> Self {
        shortcutItems == nil ? shortcutItems = [item] : shortcutItems?.append(item)
        return self
    }

    @discardableResult func remove(item: UIApplicationShortcutItem) -> Self {
        if let index = shortcutItems?.firstIndex(of: item) {
            shortcutItems?.remove(at: index)
        }
        return self
    }

    @discardableResult func removeAllShortcutItems() -> Self {
        shortcutItems?.removeAll()
        shortcutItems = nil
        return self
    }

    @discardableResult func shake(toEdit value: Bool) -> Self {
        applicationSupportsShakeToEdit = value
        return self
    }

    @discardableResult func badge(number: Int) -> Self {
        applicationIconBadgeNumber = number
        return self
    }
}
