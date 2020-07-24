//
//  UILabel+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

public protocol UILabelable {
    func text(_ t: String) -> Self
    func textColor(_ color: UIColor) -> Self
    func font(_ f: UIFont) -> Self
    func alignment(_ a: NSTextAlignment) -> Self
    func numberOfLines(_ n: Int) -> Self
    
}

public extension UILabelable where Self: UILabel {
    
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
    
    @discardableResult
    func numberOfLines(_ n: Int) -> Self {
        self.numberOfLines = n
        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ m: CGFloat) -> Self {
        self.minimumScaleFactor = m
        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ b: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = b
        return self
    }

}


extension UILabel: UILabelable {}
