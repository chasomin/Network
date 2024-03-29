//
//  Identifier.swift
//  NetworkApp
//
//  Created by 차소민 on 1/17/24.
//

import UIKit


extension UIViewController {
    static var id: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    static var id: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var id: String {
        return String(describing: self)
    }
}
