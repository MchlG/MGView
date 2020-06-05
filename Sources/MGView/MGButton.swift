//
//  File.swift
//  
//
//  Created by Mike on 6/5/20.
//

import UIKit

public class MGButton: UIButton {
    
    public var touchUp: (()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setActions()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override public var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.15, delay: 0.0, options: [.beginFromCurrentState, .allowUserInteraction], animations: {
                self.alpha = self.isHighlighted ? 0.25 : 1
            }, completion: nil)
        }
    }
    
    private func setActions() {
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc private func touchUpInside() {
        self.touchUp?()
    }
    
}

