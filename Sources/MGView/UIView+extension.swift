//
//  UIView+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

/**
Some useful helpers for UIViews. By creating custom protocol+extension and then making UIView conform, we can override these methods in UIView subclasses. If we wrote these methods directly on an extension of UIView then that wouldnt be allowed.
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
    func isUserInteractionEnabled(_ b: Bool) -> Self {
        self.isUserInteractionEnabled = b
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


extension UIView: UIViewable {}






// MARK: - Loading spinners +
public extension UIView {
    
    static let spinnnerTag: Int = 92836
    static let dimmerTag: Int = 81725
    
    func showLoadingSpinner(color: UIColor, withDimmer: Bool = true, style: UIActivityIndicatorView.Style = .large) {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.isUserInteractionEnabled = false
            
            let dimView: UIView = UIView()
                .autoResizingOff()
                .backgroundColor(UIColor.black.withAlphaComponent(0.6))
            dimView.tag = UIView.dimmerTag
            
            let spinner = UIActivityIndicatorView()
                            .autoResizingOff()
                            .backgroundColor(.clear)
            
            spinner.style = style
            spinner.color = color
            spinner.tag = UIView.spinnnerTag
            
            self?.addSubview(dimView)
            self?.addSubview(spinner)
            self?.bringSubviewToFront(spinner)
            
            dimView.topAnchor.constraint(equalTo: dimView.superview!.topAnchor).isActive = true
            dimView.leftAnchor.constraint(equalTo: dimView.superview!.leftAnchor).isActive = true
            dimView.rightAnchor.constraint(equalTo: dimView.superview!.rightAnchor).isActive = true
            dimView.bottomAnchor.constraint(equalTo: dimView.superview!.bottomAnchor).isActive = true
            
            spinner.heightAnchor.constraint(equalToConstant: 42).isActive = true
            spinner.widthAnchor.constraint(equalTo: spinner.heightAnchor).isActive = true
            spinner.centerXAnchor.constraint(equalTo: spinner.superview!.centerXAnchor).isActive = true
            spinner.centerYAnchor.constraint(equalTo: spinner.superview!.centerYAnchor).isActive = true
            
            spinner.startAnimating()
                
        }
        
    }
    
    func hideLoadingSpinner() {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.isUserInteractionEnabled = true
            
            if let spinner = self?.viewWithTag(UIView.spinnnerTag) as? UIActivityIndicatorView {
                spinner.stopAnimating()
                spinner.removeFromSuperview()
            }
            if let v = self?.viewWithTag(UIView.dimmerTag) {
                v.removeFromSuperview()
            }
                
        }
        
    }
    
}
