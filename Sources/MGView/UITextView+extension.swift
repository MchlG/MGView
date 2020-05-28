//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

public extension UITextView {
    
    @discardableResult
    func text(_ t: String) -> Self {
        self.text = t
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func font(_ f: UIFont) -> Self {
        self.font = f
        return self
    }

    @discardableResult
    func alignment(_ a: NSTextAlignment) -> Self {
        self.textAlignment = a
        return self
    }

}
