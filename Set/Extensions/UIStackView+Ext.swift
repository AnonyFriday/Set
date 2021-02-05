//
//  UIStackView+Ext.swift
//  Set
//
//  Created by Vu Kim Duy on 6/2/21.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
        
    }
    
    func removeArrangedSubviews(views: [UIView]) {
        for view in views {
            self.removeArrangedSubview(view)
        }
        
    }
}
