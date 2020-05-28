//
//  UITextField+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

public extension UITextField {
    
    @discardableResult
    func attributedPlaceholder(_ str: NSAttributedString) -> Self {
        self.attributedPlaceholder = str
        return self
    }
    
    @discardableResult
    func placeholder(_ p: String) -> Self {
        self.placeholder = p
        return self
    }
    
    @discardableResult
    func font(_ f: UIFont) -> Self {
        self.font = f
        return self
    }
    
    @discardableResult
    func textColor(_ c: UIColor) -> Self {
        self.textColor = c
        return self
    }
    
    @discardableResult
    func textAlignment(_ c: NSTextAlignment) -> Self {
        self.textAlignment = c
        return self
    }
    
    @discardableResult
    func keyboardType(_ t: UIKeyboardType) -> Self {
        self.keyboardType = t
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ isSecure: Bool = true) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
}


