//
//  UIViewController+extension.swift
//  MGView
//
//  Created by Mike on 5/28/20.
//  Copyright © 2020 MikeGordonDeveloperOrganization. All rights reserved.
//

import UIKit


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
    
    func showErrorAlert(withTitle title: String = "Oops", message: String, _ okActionCallback: (()-> Void)? = nil) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                okActionCallback?()
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
    
    func showTextFieldAlert(withTitle title: String, message: String, placeholder: String, doneCallback: @escaping ((String) -> Void)) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = placeholder
        }
        
        let doneAction = UIAlertAction(title: "Create", style: .default) { _ in
            let firstTextField = alert.textFields![0] as UITextField
            doneCallback(firstTextField.text ?? "")
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .destructive, handler: nil)

        alert.addAction(doneAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}


