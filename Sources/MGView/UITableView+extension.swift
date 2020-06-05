//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

public protocol UITableViewable {
    func separatorStyle(_ s: UITableViewCell.SeparatorStyle) -> Self
}

public extension UITableViewable where Self: UITableView {
    
    @discardableResult
    func separatorStyle(_ s: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = s
        return self
    }
    
    @discardableResult
    func keyboardDismissMode(_ m: UIScrollView.KeyboardDismissMode)-> Self {
        self.keyboardDismissMode = m
        return self
    }

    
}

extension UITableView: UITableViewable {}



