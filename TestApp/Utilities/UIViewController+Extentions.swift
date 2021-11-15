//
//  UIViewController+Extentions.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func startActivityIndicator(withMsg: String, onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let spIntialView = UIView.init(frame: CGRect(x: onView.frame.size.width/2, y: onView.frame.size.height/2, width: 120, height: 120))
        spIntialView.center = spinnerView.center
        spIntialView.backgroundColor = UIColor.clear
        spIntialView.layer.cornerRadius = 10
        spIntialView.layer.masksToBounds = true
        let label = UILabel.init(frame: CGRect(x: 0, y: 85, width: 120, height: 20))
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = NSTextAlignment.center
        label.text = withMsg
        let ai = UIActivityIndicatorView.init(frame: CGRect(x: 45, y: 45, width: 30, height: 30))
        ai.style = .large
        ai.color = UIColor.black
        
        ai.startAnimating()
        spinnerView.tag = 5000
        // ai.center = spIntialView.center
        // label.center = spIntialView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(spIntialView)
            
            spIntialView.addSubview(ai)
            spIntialView.addSubview(label)
            
            onView.addSubview(spinnerView)
        }
        
    }
    
    func stopActivityIndicator(spinner :UIView) {
        DispatchQueue.main.async {
            if ((spinner as? UITableView) != nil){
                return
            }
            for view in spinner.subviews{
                if view.tag == 5000{
                    view.removeFromSuperview()
                }
            }
            
        }
    }
    
    
    
    func showOkAlert(withTitle: String, message: String) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            }))
        self.present(alert, animated: true, completion: nil)
    }
}
