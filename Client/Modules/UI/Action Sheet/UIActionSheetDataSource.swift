//
//  UIActionSheetDataSource.swift
//  UIActionSheet
//
//  Created by Ampe on 8/1/18.
//

import UIKit

// MARK: - Data Source For UI Action Sheet
protocol UIActionSheetDataSource {
    
    // MARK: Mutating Methods
    func addAction(_ action: UIActionSheetAction)
    
    // MARK: Helper Methods
    func action(for index: IndexPath) -> UIActionSheetAction?
    func tableViewHeight() -> CGFloat
}
