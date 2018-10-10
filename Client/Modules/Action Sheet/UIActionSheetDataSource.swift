//
//  UIActionSheetDataSource.swift
//  UIActionSheet
//
//  Created by Ampe on 8/1/18.
//

import UIKit

// MARK: - Data Source For UI Action Sheet
protocol UIActionSheetDataSource {
    
    // MARK: UI Components
    var tableView: UITableView! { get set }
    
    // MARK: Properties
    var actions: [UIActionSheetAction] { get }
    var cellHeight: CGFloat { get }
    
    // MARK: Mutating Methods
    func addAction(_ action: UIActionSheetAction)
    
    // MARK: Helper Methods
    func action(for index: IndexPath) -> UIActionSheetAction?
    func tableViewHeight() -> CGFloat
}

// MARK: - Default Implementations
extension UIActionSheetDataSource {
    func action(for index: IndexPath) -> UIActionSheetAction? {
        
        guard actions.count >= index.row + 1 else {
            
            return nil
        }
        
        return actions[index.row]
    }
    
    func tableViewHeight() -> CGFloat {
        var bottomSafeSpaceHeight: CGFloat = 0
        
        if #available(iOS 11.0, *) {
            bottomSafeSpaceHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
        
        return CGFloat(actions.count) * cellHeight + bottomSafeSpaceHeight
    }
}
