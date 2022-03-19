//
//  UITableView.swift
//  ForecastTask
//
//  Created by Muhammad Ismail on 19/03/2022.
//

import Foundation
import UIKit

extension UITableView {
    
    func scrollToTop(animated: Bool) {
        setContentOffset(.zero, animated: animated)
    }
    
    func registerCell(with type: UITableViewCell.Type) {
        let name = String(describing: type.self)
        let nib = UINib.init(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func registerHeaderFooter(with type: UITableViewHeaderFooterView.Type) {
        let name = String(describing: type.self)
        let nib = UINib.init(nibName: name, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: name)
    }
    
    func dequeueReusableCell<C: UITableViewCell>(with type: C.Type, at indexPath: IndexPath) -> C? {
        let cell = dequeueReusableCell(withIdentifier: String(describing: C.self), for: indexPath) as? C
        return cell
    }
    
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let origin = view.bounds.origin
        let viewOrigin = self.convert(origin, from: view)
        let indexPath = self.indexPathForRow(at: viewOrigin)
        return indexPath
    }
    
}

