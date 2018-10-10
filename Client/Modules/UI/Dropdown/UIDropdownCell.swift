//
//  UIDropdownCell.swift
//  UIDropdown
//
//  Created by Ampe on 7/30/18.
//

import UIKit

 class UIDropdownCell: UITableViewCell {
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
    
    public required init?(coder aDecoder: NSCoder) {
        let label = UILabel()
        self.label = label
        
        super.init(coder: aDecoder)
        
        initViews()
        addViews()
        addConstraints()
    }
}

extension UIDropdownCell {
    static let reuseIdentifier = "UIDropdownCell"
}

private extension UIDropdownCell {
    func initViews() {
        selectionStyle = .none
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
