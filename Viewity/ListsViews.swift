//
//  ListsViews.swift
//  Viewity
//
//  Created by Jamal alayq on 1/26/20.
//  Copyright © 2020 Jamal.Alayq. All rights reserved.
//

import UIKit.UITableView
import UIKit.UICollectionView


// MARK:- Table views

extension UITableView: Naming {

    @discardableResult
    public func updateBatch(_ block: ()-> Void) -> Self {
        beginUpdates()
        block()
        endUpdates()
        return self
    }

    @discardableResult
    public func reload() -> Self {
        reloadData()
        return self
    }

    @discardableResult
    public func dataSource(_ source: UITableViewDataSource?) -> Self {
        dataSource = source
        return self
    }

    @discardableResult
    public func delegate(_ source: UITableViewDelegate?) -> Self {
        delegate = source
        return self
    }

    @discardableResult
    public func register<Cell: UITableViewCell>(_ type: Cell.Type) -> Self {
        let id = name(of: type)
        let nib: UINib = .init(nibName: id, bundle: .none)
        register(nib, forCellReuseIdentifier: id)
        return self
    }

    public func dequeue<Cell: UITableViewCell>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell {
        let id = name(of: type)
        guard let cell = dequeueReusableCell(withIdentifier: id, for: indexPath) as? Cell else {
            fatalError("You must pass cell name like as cell id = \(id)")
        }
        return cell
    }

    @discardableResult
    public func setNoDataView(message: String,
                              with icon: UIImage?,
                              and tintColor: UIColor = .blue,
                              for state: Bool) -> Self {
        self.backgroundView = .init()
        self.backgroundView?.background(self.backgroundColor ?? .white)
        let imageView = UIImageView(image: icon)
        imageView.tintColor = tintColor
        imageView.contentMode = .scaleAspectFill
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = .zero
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.6
        lbl.text = message
        let stk = UIStackView(arrangedSubviews: [imageView, lbl])
        stk.alignment = .center
        stk.distribution = .fill
        stk.axis = .vertical
        stk.spacing = .zero
        if state {
            let dimen = bounds.size.width * 0.3
            imageView.setDimensions(.init(width: dimen, height: dimen / 2))
            self.backgroundView?.add(stk)
            stk.putInCenter(at: .vertical)
                .align(a: .leading, to: self.backgroundView!.leadingAnchor)
                .align(a: .trailing, to: self.backgroundView!.trailingAnchor)
        } else {
            stk.removeFromSuperview()
        }
        return self
    }

}

// MARK:- Collection views

extension UICollectionView: Naming {

    @discardableResult
    public func reload() -> Self {
        reloadData()
        return self
    }

    @discardableResult
    public func dataSource(_ source: UICollectionViewDataSource?) -> Self {
        dataSource = source
        return self
    }

    @discardableResult
    public func delegate(_ source: UICollectionViewDelegate?) -> Self {
        delegate = source
        return self
    }

    @discardableResult
    public func register<Cell: UICollectionViewCell>(_ type: Cell.Type) -> Self {
        let id = name(of: type)
        let nib: UINib = .init(nibName: id, bundle: .none)
        register(nib, forCellWithReuseIdentifier: id)
        return self
    }

    public func dequeue<Cell: UICollectionViewCell>(_ type: Cell.Type, for indexPath: IndexPath) -> Cell {
        let cellName = name(of: type)
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? Cell else {
            fatalError("You must set cell name as like controller name to be \(cellName) or something else.")
        }
        return cell
    }

    public func dequeue<Cell: UICollectionReusableView>(_ type: Cell.Type,
                                                 of kind: String,
                                                 for indexPath: IndexPath) -> Cell {
        let name = self.name(of: type)
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: name,
            for: indexPath
            ) as? Cell else {
                fatalError("You must set cell name as like controller name to be \(name) or something else.")
        }
        return cell
    }

    @discardableResult
    public func setNoDataView(message: String,
                              with icon: UIImage?,
                              and tintColor: UIColor = .blue,
                              for state: Bool) -> Self {
        self.backgroundView = .init()
        self.backgroundView?.background(self.backgroundColor ?? .white)
        let imageView = UIImageView(image: icon)
        imageView.tintColor = tintColor
        imageView.contentMode = .scaleAspectFill
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = .zero
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.6
        lbl.text = message
        let stk = UIStackView(arrangedSubviews: [imageView, lbl])
        stk.alignment = .center
        stk.distribution = .fill
        stk.axis = .vertical
        stk.spacing = .zero
        if state {
            let dimen = bounds.size.width * 0.3
            imageView.setDimensions(.init(width: dimen, height: dimen / 2))
            self.backgroundView?.add(stk)
            stk.putInCenter(at: .vertical)
                .align(a: .leading, to: self.backgroundView!.leadingAnchor)
                .align(a: .trailing, to: self.backgroundView!.trailingAnchor)
        } else {
            stk.removeFromSuperview()
        }
        return self
    }

}

