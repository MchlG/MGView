//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

public protocol UITableViewCurryable {
    func separatorStyle(_ s: UITableViewCell.SeparatorStyle) -> Self
}

public extension UITableViewCurryable where Self: UITableView {
    
    @discardableResult
    func separatorStyle(_ s: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = s
        return self
    }
    
}

extension UITableView: UITableViewCurryable {}



