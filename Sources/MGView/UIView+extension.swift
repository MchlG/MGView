//
//  UIView+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

extension UIView: UIViewable {}

/**
Some useful helpers on UIView. By implementing as a protocol+extension , we can override these methods in conforming UIView subclasses. If we wrote these methods directly on an extension of UIView then that wouldnt be allowed.
*/
public protocol UIViewable {
    //always return Self so we can use with UIView subclasses
    
    func autoResizingOff() -> Self
    func backgroundColor(_ c: UIColor) -> Self
    func alpha(_ a: CGFloat) -> Self
    func cornerRadius(_ r: CGFloat, masksToBounds: Bool) -> Self
    func borderWidth(_ b: CGFloat) -> Self
    func borderColor(_ c: UIColor) -> Self
    func pinToSuper()
    func pinToSuperSafe()
    
}

public extension UIViewable where Self: UIView {
    
    //always return Self so we can use with UIView subclasses
    
    @discardableResult
    func autoResizingOff() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func backgroundColor(_ c: UIColor) -> Self {
        self.backgroundColor = c
        return self
    }
    
    @discardableResult
    func alpha(_ a: CGFloat) -> Self {
        self.alpha = a
        return self
    }
    
    @discardableResult
    func cornerRadius(_ r: CGFloat, masksToBounds: Bool = true) -> Self {
        self.layer.cornerRadius = r
        self.layer.masksToBounds = masksToBounds
        return self
    }
    
    @discardableResult
    func borderWidth(_ b: CGFloat) -> Self {
        self.layer.borderWidth = b
        return self
    }
    
    @discardableResult
    func borderColor(_ c: UIColor) -> Self {
        self.layer.borderColor = c.cgColor
        return self
    }
    
    
    @discardableResult
    func isHidden(_ h: Bool = true) -> Self{
        self.isHidden = h
        return self
    }
    
    @discardableResult
    func debug_borders() -> Self{
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 2
        return self
    }
    
    @discardableResult
    func contentMode(_ m: UIView.ContentMode)-> Self {
        self.contentMode = m
        return self
    }
    
    func pinToSuper() {
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: self.superview!.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: self.superview!.leftAnchor).isActive = true
    }
    
    func pinToSuperSafe() {
        self.topAnchor.constraint(equalTo: self.superview!.safeAreaLayoutGuide.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: self.superview!.safeAreaLayoutGuide.rightAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: self.superview!.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    
}
