//
//  OSExtensions.swift
//  onlineShop
//
//  Created by Madiyar Zhenis on 05.06.2024.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    
    func add(_ subview: UIView, _ closure: ((_ make: ConstraintMaker) -> Void)) {
        self.addSubview(subview)
        subview.snp.makeConstraints(closure)
    }
    
    func addShadow() {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = .init(width: 0, height: 14)
            layer.shadowRadius = 8
            layer.shadowOpacity = 0.2
        }
}
