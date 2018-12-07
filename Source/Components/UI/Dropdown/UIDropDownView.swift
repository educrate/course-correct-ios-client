//
//  UItableViewView.swift
//  Client
//
//  Created by Christian Ampe on 11/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

// MARK: - Class Declaration
final class UIDropDownView: XIBView {
    
    // MARK: View Outlets
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Delegation
    weak var delegate: UIDropDownViewDelegate?
    
    // MARK: Internal Constants
    private let cellHeight: CGFloat = 50
    
    // MARK: Internal Properties
    private var data: [String] = []
    private var configuration: UIDropDownViewConfiguration = .default
    
    // MARK: Public Properties
    var selection: String {
        return textField.text ?? ""
    }
}

private extension UIDropDownView {
    @IBAction func inputChanged(_ sender: UITextField, forEvent event: UIEvent) {
        delegate?.inputChanged(sender)
    }
}

extension UIDropDownView {
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        configure(configuration)
    }
}

// MARK: Public API
extension UIDropDownView {
    func beginEditing() {
        textField.becomeFirstResponder()
    }
    
    func endEditing() {
        textField.resignFirstResponder()
    }
    
    func reload() {
        tableView.reloadData()
        tableView.isHidden = false
    }
    
    func set(_ newData: [String]) {
        data = newData
    }
    
    func set(_ newConfiguration: UIDropDownViewConfiguration) {
        configuration = newConfiguration
    }
}

// MARK: Private Methods
private extension UIDropDownView {
    func registerCell() {
        tableView.register(xibCell: UIDropDownViewCell.self)
    }
    
    func configure(_ configuration: UIDropDownViewConfiguration) {
        textField.text = configuration.text
        textField.tintColor = configuration.cursorColor
        textField.textColor = configuration.textColor
        textField.textAlignment = configuration.textAlignment
        textField.attributedPlaceholder = NSAttributedString(string: configuration.placeholder,
                                                              attributes: [NSAttributedString.Key.foregroundColor: configuration.placeholderColor])
    }
}

extension UIDropDownView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(data.count, Int(bounds.height / cellHeight))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < data.count else {
            return UITableViewCell()
        }
        
        let cell: UIDropDownViewCell = tableView.dequeueReusableCell(for: indexPath)
        let title = data[indexPath.row]
        
        cell.set(title)
        
        return cell
    }
}

extension UIDropDownView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.dropDown(tableView, didSelectRowAt: indexPath)
        
        guard indexPath.row < data.count else {
            return
        }
        
        let title = data[indexPath.row]
        textField.text = title
        
        tableView.isHidden = true
    }
}
