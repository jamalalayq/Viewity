//
//  ImageViews.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UIImageView

public extension UIImageView {

    @discardableResult
    func image(_ value: UIImage) -> Self {
        image = value
        return self
    }

    @discardableResult
    func content(mode: ContentMode) -> Self {
        contentMode = mode
        return self
    }

}

public protocol Cacheable { }

public extension Cacheable where Self: UIImageView {

    func loadImage(from link: String, hint: UIImage? = .none, _ errorHandler: ((Error?) -> Void)? = nil) {
        guard let url = URL(string: link.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed ) ?? "") else {
            DispatchQueue.main
                .async {
                    self.image = hint
                    errorHandler?(nil)
            }
            return print(#function, "Can't load image")
        }

        let session: URLSession = URLSession(configuration: .default)
        session.configuration.allowsCellularAccess = true
        session.configuration.requestCachePolicy = .useProtocolCachePolicy
        session.dataTask(with: url) { (_data, _, _error) in
            if _error != nil {
                do {
                    let urlContent = try Data(contentsOf: url)
                    DispatchQueue.main
                        .async {
                            self.image = UIImage(data: urlContent)
                    }
                } catch {
                    DispatchQueue.main
                        .async {
                            self.image = hint
                            errorHandler?(error)
                    }
                }
                return
            }
            DispatchQueue.main
                .async {
                    if let imageData = _data {
                        self.image = UIImage(data: imageData)
                    } else {
                        self.image = hint
                        errorHandler?(nil)
                    }
            }
        }
    }

}
