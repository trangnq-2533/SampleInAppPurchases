//
//  UITableView+Extensions.swift
//  SampleInAppPurchases
//
//  Created by Nguyen Quynh Trang B on 08/06/2022.
//

import UIKit
extension UITableView {
    func registerWithNib<T: UITableViewCell>(_: T.Type) {
        register(UINib(nibName: T.nibName, bundle: .main), forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue reusable cell with identifier: \(T.identifier)")
        }
        return cell
    }

    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0) {
            self.reloadData()
        } completion: { _ in
            completion()
        }
    }
}

extension UITableViewCell {
    class var nibName: String {
        return String(describing: self)
    }
}
