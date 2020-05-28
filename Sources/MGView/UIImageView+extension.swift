//
//  UIImageView+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

public extension UIImageView {
    
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


