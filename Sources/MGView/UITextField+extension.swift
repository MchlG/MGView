//
//  UITextField+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

public protocol UITextFieldable {
    func attributedPlaceholder(_ str: NSAttributedString) -> Self
    func placeholder(_ p: String) -> Self
    func font(_ f: UIFont) -> Self
    func textColor(_ c: UIColor) -> Self
    func textAlignment(_ c: NSTextAlignment) -> Self
    func keyboardType(_ t: UIKeyboardType) -> Self
    func isSecureTextEntry(_ isSecure: Bool) -> Self
}

public extension UITextFieldable where Self: UITextField {

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
    func text(_ t: String) -> Self {
        self.text = t
        return self
    }
    
    @discardableResult
    func attributedText(_ t: NSAttributedString) -> Self {
        self.attributedText = t
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ isSecure: Bool = true) -> Self {
        self.isSecureTextEntry = isSecure
        return self
    }
}



extension UITextField: UITextFieldable {}
