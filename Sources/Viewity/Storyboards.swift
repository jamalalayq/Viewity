//
//  Storyboards.swift
//  
//
//  Created by Jamal alayq on 5/27/20.
//

import UIKit.UIStoryboard

public extension UIStoryboard {

    func bring<Controller: UIViewController>(_ type: Controller.Type) -> Controller {
        let id = String(describing: type.self)
        guard let controller = instantiateViewController(withIdentifier: id) as? Controller else {
            fatalError("Make sure the controller name is equal controller id at storyboard. passed name is \(id)")
        }
        return controller
    }
}
