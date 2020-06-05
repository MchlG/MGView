//
//  File.swift
//  
//
//  Created by Mike on 6/5/20.
//

import UIKit

public class ECMImageView: UIImageView {
    
    public var tapped: (()-> Void)?
    
    init() {
        super.init(frame: .zero)
        setActions()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setActions() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func didTap() {
        self.tapped?()
    }
    
}
