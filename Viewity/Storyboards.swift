//
//  Storyboards.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIStoryboard

extension UIStoryboard: Naming {

    public func bring<Controller: UIViewController>(_ type: Controller.Type) -> Controller {
        let id = name(of: type.self)
        guard let controller = instantiateViewController(withIdentifier: id) as? Controller else {
            fatalError("You must set controller name and id = \(id)")
        }
        return controller
    }

}
