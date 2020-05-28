//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

extension NSAttributedString {
    
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

extension String {

    func color(_ c: UIColor) -> NSAttributedString {
        return NSAttributedString(string: self).color(c)
    }

    func font(_ f: UIFont) -> NSAttributedString {
        return NSAttributedString(string: self).font(f)
    }

    func underlined(_ u: Bool, _ style: NSUnderlineStyle = NSUnderlineStyle.single) -> NSAttributedString {
        return NSAttributedString(string: self).underlined(u, style)
    }

    func alignment(_ a: NSTextAlignment) -> NSAttributedString {
        return NSAttributedString(string: self).alignment(a)
    }

    func lineSpacing(_ ls: CGFloat) -> NSAttributedString {
        return NSAttributedString(string: self).lineSpacing(ls)
    }

    func lineHeightMultiple(_ lhm: CGFloat) -> NSAttributedString {
        return NSAttributedString(string: self).lineHeightMultiple(lhm)
    }

    func truncated(_ t: Bool, _ lineBreakMode: NSLineBreakMode = .byTruncatingTail) -> NSAttributedString {
        return NSAttributedString(string: self).truncated(t, lineBreakMode)
    }

}
