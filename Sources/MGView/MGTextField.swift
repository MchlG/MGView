//
//  File.swift
//  
//
//  Created by Mike on 6/5/20.
//

import UIKit

public class ECMTextField: UITextField {
    
    public var editingChangedCallback: ((String?)->Void)? {
        didSet {
            if editingChangedCallback != nil {
                self.addTarget(self, action: #selector(editingDidChange), for: .editingChanged)
            } else {
                self.removeTarget(self, action: #selector(editingDidChange), for: .editingChanged)
            }
        }
    }
    
    @objc private func editingDidChange() {
        editingChangedCallback?(self.text)
    }
    
}

