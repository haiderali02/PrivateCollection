//
//  ViewExtension.swift
//  PrinkiOS
//
//  Created by Haider Ali on 26/08/2022.
//  Copyright © 2022 PrinkCo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = newValue
        }
    }
    
}

// Gestures

extension UIView {
    
    func rightValidAccessoryView() -> UIView {
        let imgView = UIImageView(image: UIImage(named: "check_valid"))
        imgView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imgView.backgroundColor = UIColor.clear
        return imgView
    }
    
    func rightInValidAccessoryView() -> UIView {
        let imgView = UIImageView(image: UIImage(named: "check_invalid"))
        imgView.frame = CGRect(x: self.cornerRadius, y: self.cornerRadius, width: 20, height: 20)
        imgView.backgroundColor = UIColor.clear
        return imgView
    }
    
    public func addTapGestureRecognizer(shouldAnimate: Bool = true, action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        
        if shouldAnimate {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
            self.addGestureRecognizer(tapGestureRecognizer)
        } else {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureWithoutAnimation))
            self.addGestureRecognizer(tapGestureRecognizer)
        }
        
    }
    
    
    public func addLongTapGestureRecognizer(shouldAnimate: Bool = false, action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        
        let tapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongTapGestureWithoutAnimation))
        tapGestureRecognizer.minimumPressDuration = 0.5
        
        self.addGestureRecognizer(tapGestureRecognizer)
        
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension UIView {
    
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        
        if sender.view is UILabel {
            if let action = self.tapGestureRecognizerAction {
                action?()
            } else {
                print("no action")
            }
            return
        } else {
            sender.view?.animateButton({
                if let action = self.tapGestureRecognizerAction {
                    action?()
                } else {
                    print("no action")
                }
            })
        }
    }
    
    @objc fileprivate func handleTapGestureWithoutAnimation(sender: UITapGestureRecognizer) {
        
        if sender.view is UILabel {
            if let action = self.tapGestureRecognizerAction {
                action?()
            } else {
                print("no action")
            }
            return
        } else {
            if let action = self.tapGestureRecognizerAction {
                action?()
            } else {
                print("no action")
            }
        }
    }
    
    @objc fileprivate func handleLongTapGestureWithoutAnimation(sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            if sender.view is UILabel {
                if let action = self.tapGestureRecognizerAction {
                    action?()
                } else {
                    print("no action")
                }
                return
            } else {
                if let action = self.tapGestureRecognizerAction {
                    action?()
                } else {
                    print("no action")
                }
            }
        }
    }
    
    
}

public extension UIView {
    
    /**
     Fade in a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    /**
     Fade out a view with a duration
     
     - parameter duration: custom animation duration
     */
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }
    
    func fadeInOut(duration: TimeInterval = 1.0) {
        
        UIView.animate(withDuration: duration, delay: 0, options: [.repeat, .autoreverse]) {
            self.alpha = 0.0
        } completion: { isCompleted in
            // do nothing
        }
    }
    
}

public extension UIView {
    func animateButton(_ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.90, y: 0.90)
            
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}

