//
//  File.swift
//  
//
//  Created by Mike on 5/28/20.
//

import UIKit

protocol StringCurryable {
    func color(_ c: UIColor) -> NSAttributedString
    func font(_ f: UIFont) -> NSAttributedString
    func underlined(_ u: Bool, _ style: NSUnderlineStyle) -> NSAttributedString
    func alignment(_ a: NSTextAlignment) -> NSAttributedString
    func lineSpacing(_ ls: CGFloat) -> NSAttributedString
    func lineHeightMultiple(_ lhm: CGFloat) -> NSAttributedString
    func truncated(_ t: Bool, _ lineBreakMode: NSLineBreakMode) -> NSAttributedString
}

extension StringCurryable where Self == String {

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

extension String: StringCurryable {}
