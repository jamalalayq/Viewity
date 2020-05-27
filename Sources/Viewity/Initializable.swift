//
//  Initializable.swift
//  
//
//  Created by Jamal alayq on 5/27/20.
//

import Foundation
import UIKit

public protocol Initializable {
    static func instance<Controller: UIViewController>(_: Controller.Type) -> Self
    static func instantiate(from storyboard: UIStoryboard) -> Self
    static func instantiate(byStoryboard name: String) -> Self
    static func instantiate<Screen: UIViewController>(_: Screen.Type) -> Screen
}

public extension Initializable where Self: UIViewController {
    static func instance<Screen: UIViewController>(_: Screen.Type) -> Self {
        let name = String(describing: self)
        let screen = Screen(nibName: name, bundle: .init(for: Screen.self)) as! Self
        return screen
    }

    /// Get instance from storyboard by storyboard instance
    static func instantiate(from storyboard: UIStoryboard) -> Self {
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }

    /// Get instance from storyboard by storyboard name
    static func instantiate(byStoryboard name: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: .init(for: Self.self))
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }

    /// Get instance from storyboard by view controller type
    static func instantiate<Screen: UIViewController>(_: Screen.Type) -> Screen {
        let id = String(describing: Screen.self)
        let storyboard = UIStoryboard(name: id, bundle: .init(for: Screen.self))
        return storyboard.instantiateViewController(withIdentifier: id) as! Screen
    }
}
