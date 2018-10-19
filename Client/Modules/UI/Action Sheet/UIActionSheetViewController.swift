//
//  UIActionSheetViewController.swift
//  Client
//
//  Created by Ampe on 10/16/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UIActionSheetViewController: UIViewController {
    
    // MARK: Static Instance
    private static let main: UIActionSheetViewController = {
        let storyboard = UIStoryboard(storyboard: .uiActionSheet)
        let viewController: UIActionSheetViewController = storyboard.instantiateViewController()
        viewController.view.backgroundColor = viewController.backgroundColor.withAlphaComponent(0)
        return viewController
    }()
    
    // MARK: Views
    @IBOutlet private weak var optionTable: UITableView!
    
    // MARK: Constraints
    @IBOutlet private weak var optionTableVisibilityConstraint: NSLayoutConstraint!
    @IBOutlet private weak var optionTableHeightConstraint: NSLayoutConstraint!
    
    // MARK: Configuration
    private let backgroundColor: UIColor = .black
    private let maxBackgroundAlphaValue: CGFloat = 0.5
    private let durationOfShowAnimation: TimeInterval = 0.3
    private let durationOfHideAnimation: TimeInterval = 0.1
    private let cellHeight: CGFloat = 60
    
    // MARK: Properties
    private var actions: [UIActionSheetOption] = []
}

extension UIActionSheetViewController {
    static func show(with options: [UIActionSheetOption]) {
        main.add(options)
        DispatchQueue.main.async {
            self.main.show()
        }
    }
    
    static func hide() {
        main.hide()
    }
}

extension UIActionSheetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < actions.count else {
            return UITableViewCell()
        }
        
        let cell: UIActionSheetCell = optionTable.dequeueReusableCell(for: indexPath)
        let title = actions[indexPath.row].title
        
        cell.set(title: title)
        
        return cell
    }
}

extension UIActionSheetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
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

private extension UIActionSheetViewController {
    func add(_ options: [UIActionSheetOption]) {
        actions = options
        optionTable.reloadData()
    }
}

private extension UIActionSheetViewController {
    func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return
        }
        
        optionTableHeightConstraint.constant = optionsTableMaxVisibilityHeight
        
        keyWindow.addSubview(view)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(durationOfShowAnimation)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
        
        animate(constraint: optionTableVisibilityConstraint,
                to: optionsTableMaxVisibilityHeight,
                with: durationOfShowAnimation)
        
        animate(alpha: maxBackgroundAlphaValue,
                with: durationOfShowAnimation)
        
        CATransaction.commit()
    }
    
    func hide() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(durationOfHideAnimation)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
        CATransaction.setCompletionBlock { self.view.removeFromSuperview() }
        
        animate(constraint: optionTableVisibilityConstraint,
                to: 0,
                with: durationOfHideAnimation)
        
        animate(alpha: 0,
                with: durationOfHideAnimation)
        
        CATransaction.commit()
    }
}

private extension UIActionSheetViewController {
    func animate(constraint: NSLayoutConstraint,
                 to value: CGFloat,
                 with duration: TimeInterval) {
        
        constraint.constant = value
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    func animate(alpha: CGFloat,
                 with duration: TimeInterval) {
        
        UIView.animate(withDuration: duration) {
            self.view.backgroundColor = self.view.backgroundColor?.withAlphaComponent(alpha)
        }
    }
}

private extension UIActionSheetViewController {
    var optionsTableMaxVisibilityHeight: CGFloat {
        return cellHeight * CGFloat(actions.count) + safeSpaceHeight
    }
    
    var safeSpaceHeight: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        } else {
            return 0
        }
    }
}
