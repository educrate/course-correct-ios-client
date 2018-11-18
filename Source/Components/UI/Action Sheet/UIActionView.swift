//
//  UIActionSheetView.swift
//  Client
//
//  Created by Ampe on 11/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UIActionView: XIBView {
    
    // MARK: Static Instance
    private static let main: UIActionView = {
        let view = UIActionView(frame: .zero)
        view.backgroundColor = view.configuration.backgroundColor.withAlphaComponent(0)
        view.optionsTableView.register(xibCell: UIActionViewCell.self)
        return view
    }()
    
    // MARK: View Outlets
    @IBOutlet private weak var optionsTableView: UITableView!
    
    // MARK: Constraint Outlets
    @IBOutlet private weak var optionsTableViewVisibilityConstraint: NSLayoutConstraint!
    @IBOutlet private weak var optionsTableViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    private var configuration: UIActionViewConfiguration = .default
    private var actions: [UIActionViewOption] = []
}

extension UIActionView {
    static func show(with options: [UIActionViewOption]) {
        main.add(options)
        DispatchQueue.main.async {
            self.main.show()
        }
    }
    
    static func hide() {
        main.hide()
    }
}

extension UIActionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < actions.count else {
            return UITableViewCell()
        }
        
        let cell: UIActionViewCell = optionsTableView.dequeueReusableCell(for: indexPath)
        let title = actions[indexPath.row].title
        
        cell.set(title: title)
        
        return cell
    }
}

extension UIActionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return configuration.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < actions.count else {
            return
        }
        
        let action = actions[indexPath.row].action
        action?()
        
        hide()
    }
}

private extension UIActionView {
    func add(_ options: [UIActionViewOption]) {
        actions = options
        optionsTableView.reloadData()
    }
}

private extension UIActionView {
    func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        optionsTableViewHeightConstraint.constant = optionsTableMaxVisibilityHeight
        keyWindow.addSubview(self)
        
        constrain(to: keyWindow)
        
        layoutIfNeeded()
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(configuration.durationOfShowAnimation)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
        
        animate(constraint: optionsTableViewVisibilityConstraint,
                to: optionsTableMaxVisibilityHeight,
                with: configuration.durationOfShowAnimation)
        
        animate(alpha: configuration.maxBackgroundAlphaValue,
                with: configuration.durationOfShowAnimation)
        
        CATransaction.commit()
    }
    
    func constrain(to window: UIWindow) {
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
    }
    
    func hide() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(configuration.durationOfHideAnimation)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
        CATransaction.setCompletionBlock {
            self.removeFromSuperview()
        }
        
        animate(constraint: optionsTableViewVisibilityConstraint,
                to: 0,
                with: configuration.durationOfHideAnimation)
        
        animate(alpha: 0,
                with: configuration.durationOfHideAnimation)
        
        CATransaction.commit()
    }
}

private extension UIActionView {
    func animate(constraint: NSLayoutConstraint,
                 to value: CGFloat,
                 with duration: TimeInterval) {
        
        constraint.constant = value
        UIView.animate(withDuration: duration) {
            self.layoutIfNeeded()
        }
    }
    
    func animate(alpha: CGFloat,
                 with duration: TimeInterval) {
        
        UIView.animate(withDuration: duration) {
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(alpha)
        }
    }
}

private extension UIActionView {
    var optionsTableMaxVisibilityHeight: CGFloat {
        return configuration.cellHeight * CGFloat(actions.count) + safeSpaceHeight
    }
    
    var safeSpaceHeight: CGFloat {
        guard #available(iOS 11.0, *), let keyWindow = UIApplication.shared.keyWindow else {
            return 0
        }
        
        return keyWindow.safeAreaInsets.bottom
    }
}
