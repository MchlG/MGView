//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

public protocol NSAttributedStringable {
    func color(_ c: UIColor) -> NSAttributedString
    func font(_ f: UIFont) -> NSAttributedString
    func underlined(_ u: Bool, _ style: NSUnderlineStyle) -> NSAttributedString
    func alignment(_ a: NSTextAlignment) -> NSAttributedString
    func lineSpacing(_ ls: CGFloat) -> NSAttributedString
    func kerning(_ k: CGFloat) -> NSAttributedString
    func lineHeightMultiple(_ lhm: CGFloat) -> NSAttributedString
    func truncated(_ t: Bool, _ lineBreakMode: NSLineBreakMode) -> NSAttributedString
}

public extension NSAttributedStringable where Self: NSAttributedString {
    
    @discardableResult
    func color(_ c: UIColor) -> NSAttributedString {
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.foregroundColor: c]
        mutable.addAttributes(attr, range: range)

        return mutable
    }
    
    @discardableResult
    func font(_ f: UIFont) -> NSAttributedString {
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.font: f]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }
    
    @discardableResult
    func underlined(_ u: Bool, _ style: NSUnderlineStyle = NSUnderlineStyle.single) -> NSAttributedString {
        
        guard !self.string.isEmpty else { return self }
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let style = u ? style.rawValue : 0
        let attr = [NSAttributedString.Key.underlineStyle: style]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }
    
    @discardableResult
    func alignment(_ a: NSTextAlignment) -> NSAttributedString {
        
        let p = self.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle  ?? NSMutableParagraphStyle()
        p.alignment = a
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.paragraphStyle: p]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }
    
    @discardableResult
    func lineSpacing(_ ls: CGFloat) -> NSAttributedString {
        
        guard !self.string.isEmpty else { return self }
        
        let p = self.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle  ?? NSMutableParagraphStyle()
        p.lineSpacing = ls
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.paragraphStyle: p]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }
    
    @discardableResult
    func kerning(_ k: CGFloat) -> NSAttributedString {
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.kern: k]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }
    
    @discardableResult
    func lineHeightMultiple(_ lhm: CGFloat) -> NSAttributedString {
        
        guard !self.string.isEmpty else { return self }
        
        let p = self.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle  ?? NSMutableParagraphStyle()
        p.lineHeightMultiple = lhm
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.paragraphStyle: p]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }
    
    
    @discardableResult
    func truncated(_ t: Bool, _ lineBreakMode: NSLineBreakMode = .byTruncatingTail) -> NSAttributedString {
        
        guard !self.string.isEmpty else { return self }
        
        let p = self.attribute(.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle  ?? NSMutableParagraphStyle()
        
        p.lineBreakMode = lineBreakMode
        
        let mutable = NSMutableAttributedString(attributedString: self)
        let range = (string as NSString).range(of: string)
        let attr = [NSAttributedString.Key.paragraphStyle: p]
        mutable.addAttributes(attr, range: range)
        
        return mutable
        
    }

    
}

extension NSAttributedString: NSAttributedStringable {}


