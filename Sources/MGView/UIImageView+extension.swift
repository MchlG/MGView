//
//  UIImageView+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

public protocol UIImageViewable {
    func image(_ i: UIImage?)-> Self
    func contentMode(_ m: UIView.ContentMode)-> Self
}

public extension UIImageViewable where Self: UIImageView {
    
    @discardableResult
    func image(_ i: UIImage?)-> Self {
        self.image = i
        return self
    }
    
    @discardableResult
    func contentMode(_ m: UIView.ContentMode)-> Self {
        self.contentMode = m
        return self
    }
    
}


extension UIImageView: UIImageViewable {}
