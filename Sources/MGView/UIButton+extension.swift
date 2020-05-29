//
//  UIButton+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit


public protocol Buttonable {
    
    func text(_ t: String, state: UIControl.State)-> Self
    func textColor(_ c: UIColor, state: UIControl.State) -> Self
    func font(_ f: UIFont)-> Self
    func attributedText(_ t: NSAttributedString, state: UIControl.State)-> Self
    func image(_ i: UIImage?, state: UIControl.State)-> Self
    func backgroundImage(_ i: UIImage?, state: UIControl.State)-> Self
    func enabled(_ e: Bool)-> Self
    
}

public extension Buttonable where Self: UIButton {
    
    @discardableResult
    func text(_ t: String, state: UIControl.State = .normal)-> Self {
        self.setTitle(t, for: state)
        return self
    }
    
    @discardableResult
    func textColor(_ c: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(c, for: state)
        return self
    }
    
    @discardableResult
    func font(_ f: UIFont)-> Self {
        self.titleLabel?.font = f
        return self
    }
    
    @discardableResult
    func attributedText(_ t: NSAttributedString, state: UIControl.State = .normal)-> Self {
        self.setAttributedTitle(t, for: state)
        return self
    }
    
    @discardableResult
    func image(_ i: UIImage?, state: UIControl.State = .normal)-> Self {
        self.setImage(i, for: state)
        return self
    }
    
    @discardableResult
    func backgroundImage(_ i: UIImage?, state: UIControl.State = .normal)-> Self {
        self.setBackgroundImage(i, for: state)
        return self
    }
    
    @discardableResult
    func enabled(_ e: Bool)-> Self {
        self.isEnabled = e
        return self
    }
    
    @discardableResult
    func imageEdgeInsets(_ i: UIEdgeInsets)-> Self {
        self.imageEdgeInsets = i
        return self
    }
    
}


extension UIButton: Buttonable {}
