//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

public extension UITableView {
    
    @discardableResult
    func separatorStyle(_ s: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = s
        return self
    }
    
}



