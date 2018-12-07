//
//  UINotificationView.swift
//  Client
//
//  Created by Christian Ampe on 11/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

final class UINotificationView: XIBView {
    
    // MARK: Static Instance
    private static let main: UINotificationView = {
        let view = UINotificationView(frame: .zero)
        view.configure(with: .default)
        return view
    }()
    
    // MARK: View Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var label: UILabel!
    
    // MARK: Constraint Outlets
    @IBOutlet private weak var labelTopConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    private var configuration: UINotificationViewConfiguration = .default
}

extension UINotificationView {
    override func awakeFromNib() {
        super.awakeFromNib()
        configure(with: configuration)
    }
}

extension UINotificationView {
    static func show(with message: String) {
        DispatchQueue.main.async {
            self.main.show(message)
        }
    }
    
    static func hide() {
        main.hide()
    }
    
    static func style(with configuration: UINotificationViewConfiguration) {
        main.style(with: configuration)
    }
}

private extension UINotificationView {
    func show(_ message: String) {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        label.text = message
        keyWindow.addSubview(self)
        
        constrain(to: keyWindow)
        
        animate(view: self,
                to: 0,
                with: configuration.durationOfShowAnimation) { didComplete in
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.configuration.durationOfPersistence) {
                        self.hide()
                    }
        }
    }
    
    func constrain(to window: UIWindow) {
        labelTopConstraint.constant = maxVisibleHeight
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: window.topAnchor).isActive = true
    }
    
    func hide() {
        animate(view: self,
                to: -viewHeight,
                with: configuration.durationOfHideAnimation) { didComplete in
                    self.removeFromSuperview()
        }
    }
    
    func style(with configuration: UINotificationViewConfiguration) {
        self.configuration = configuration
    }
}

private extension UINotificationView {
    func animate(view: UIView,
                 to minY: CGFloat,
                 with duration: TimeInterval,
                 completion: ((Bool) -> Void)?) {
        
        view.superview?.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            var newFrame = view.frame
            newFrame.origin.y = minY
            
            view.frame = newFrame
        }, completion: completion)
    }
}

private extension UINotificationView {
    func configure(with configuration: UINotificationViewConfiguration) {
        label.textColor = configuration.textColor
        label.textAlignment = configuration.textAlignment
        backgroundColor = configuration.backgroundColor
    }
}

private extension UINotificationView {
    var viewHeight: CGFloat {
        return bounds.height
    }
    
    var safeSpaceHeight: CGFloat {
        return safeAreaInsets.top
    }
    
    var maxVisibleHeight: CGFloat {
        return safeSpaceHeight + 16
    }
}
