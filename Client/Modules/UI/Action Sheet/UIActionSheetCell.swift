//
//  UIActionSheetCell.swift
//  UIActionSheet
//
//  Created by Ampe on 8/1/18.
//

import UIKit

class UIActionSheetCell: UITableViewCell {
    weak var label: UILabel!
    
    func update(_ string: String) {
        label.text = string
    }
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let label = UILabel()
        self.label = label
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initViews()
        addViews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        let label = UILabel()
        self.label = label
        
        super.init(coder: aDecoder)
        
        initViews()
        addViews()
        addConstraints()
    }
}

extension UIActionSheetCell {
    static let reuseIdentifier = "UIActionSheetCell"
}

private extension UIActionSheetCell {
    func initViews() {
        selectionStyle = .none
        label.textAlignment = .center
    }
    
    func addViews() {
        addSubview(label)
    }
    
    func addConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}
