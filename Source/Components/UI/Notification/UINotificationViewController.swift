//
//  UINotificationViewController.swift
//  Client
//
//  Created by Christian Ampe on 10/16/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UINotificationViewController: UIViewController {
    
    // MARK: Static Instance
    private static let main: UINotificationViewController = {
        let storyboard = UIStoryboard(storyboard: .uiNotification)
        let viewController: UINotificationViewController = storyboard.instantiateViewController()
        return viewController
    }()
    
    // MARK: Views
    @IBOutlet private weak var label: UILabel!
    
    // MARK: Constraints
    @IBOutlet private weak var labelTopConstraints: NSLayoutConstraint!
    
    // MARK: Properties
    private var configuration: UINotificationConfiguration = .default
}

extension UINotificationViewController {
    static func show(with message: String) {
        DispatchQueue.main.async {
            self.main.show(message)
        }
    }
    
    static func hide() {
        main.hide()
    }
    
    static func style(with configuration: UINotificationConfiguration) {
        main.style(with: configuration)
    }
}

private extension UINotificationViewController {
    func show(_ message: String) {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        setUp(keyWindow)
        
        label.text = message

        layout(on: keyWindow)
        
        animate(view: view,
                to: 0,
                with: configuration.durationOfShowAnimation) { didComplete in
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.configuration.durationOfPersistence) {
                        self.hide()
                    }
        }
    }
    
    func hide() {
        animate(view: view,
                to: -labelHeight,
                with: configuration.durationOfHideAnimation) { didComplete in
                    self.view.removeFromSuperview()
        }
    }
    
    func setUp(_ window: UIWindow) {
        view.layoutIfNeeded()
        labelTopConstraints.constant = maxVisibleHeight
        window.addSubview(view)
    }
    
    func layout(on window: UIWindow) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: window.topAnchor).isActive = true
    }
    
    func style(with configuration: UINotificationConfiguration) {
        self.configuration = configuration
    }
}

extension UINotificationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: configuration)
    }
}

private extension UINotificationViewController {
    func animate(view: UIView,
                 to minY: CGFloat,
                 with duration: TimeInterval,
                 completion: ((Bool) -> Void)?) {
        
        view.superview?.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            var newFrame = view.frame
            newFrame.origin.y = minY

            view.frame = newFrame
            view.superview?.layoutIfNeeded()
        }, completion: completion)
    }
}

private extension UINotificationViewController {
    func configure(with configuration: UINotificationConfiguration) {
        label.textColor = configuration.textColor
        label.textAlignment = configuration.textAlignment
        view.backgroundColor = configuration.backgroundColor
    }
}

private extension UINotificationViewController {
    var labelHeight: CGFloat {
        return label.bounds.height
    }
    
    var safeSpaceHeight: CGFloat {
        guard #available(iOS 11.0, *), let keyWindow = UIApplication.shared.keyWindow else {
            return 0
        }
        
        return keyWindow.safeAreaInsets.bottom
    }
    
    var maxVisibleHeight: CGFloat {
        return safeSpaceHeight + 16
    }
}
