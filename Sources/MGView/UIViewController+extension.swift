//
//  UIViewController+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit

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

// MARK: - Alerts
public extension UIViewController {
    
    func showAlertNoActions(withTitle title: String, message: String?, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            self?.present(alert, animated: true, completion: completion)
        }
    }
    
    func dismissAlert(animated: Bool = true, _ completion: (()->Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: animated, completion: completion)
        }
    }
    
    func showAlert(withTitle title: String, message: String?, _ completion: (()-> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                completion?()
            })
                
            alert.addAction(okAction)
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertConfirm(withTitle title: String, message: String? , isCancel:Bool = false, completion: (() -> Void)? = nil){
        
        DispatchQueue.main.async { [weak self] in
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            //alert.view.tintColor = UIColor.red
            alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.red]), forKey: "attributedTitle")
            alert.setValue(NSAttributedString(string: message!, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.red]), forKey: "attributedMessage")
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
                completion!()
            }))
            if(isCancel){
                alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            }
            
            self?.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
}


