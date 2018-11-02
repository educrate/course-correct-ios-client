//
//  UIDropdown.swift
//  Client
//
//  Created by Christian Ampe on 7/30/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

protocol UIDropdownDelegate: class {
    var cellHeight: CGFloat { get }
    func inputChanged(_ sender: UITextField)
    func dropdown(_ dropdown: UITableView, didSelectRowAt indexPath: IndexPath)
}

// MARK: - Class Declaration
class UIDropdownViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var inputField: UITextField!
    @IBOutlet private weak var dropdown: UITableView!
    
    // MARK: IBActions
    @IBAction func inputChanged(_ sender: UITextField, forEvent event: UIEvent) {
        delegate?.inputChanged(sender)
    }
    
    // MARK: Delegation
    weak var delegate: UIDropdownDelegate?
    
    // MARK: Internal Properties
    private var data: [String] = []
    private var configuration: UIDropdownConfiguration = .default
    
    // MARK: Public Properties
    var selection: String {
        return inputField.text ?? ""
    }
}

extension UIDropdownViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(for: configuration)
    }
}

// MARK: Public API
extension UIDropdownViewController {
    func setDropdown(_ newData: [String]) {
        data = newData
        dropdown.reloadData()
        dropdown.isHidden = false
    }
    
    func style(with configuration: UIDropdownConfiguration) {
        self.configuration = configuration
    }
    
    func beginEditing() {
        inputField.becomeFirstResponder()
    }
    
    func endEditing() {
        inputField.resignFirstResponder()
    }
}

// MARK: Private Methods
private extension UIDropdownViewController {
    func configure(for configuration: UIDropdownConfiguration) {
        inputField.text = configuration.text
        inputField.tintColor = configuration.cursorColor
        inputField.textColor = configuration.textColor
        inputField.textAlignment = configuration.textAlignment
        inputField.attributedPlaceholder = NSAttributedString(string: configuration.placeholder,
                                                         attributes: [NSAttributedString.Key.foregroundColor: configuration.placeholderColor])
    }
}

extension UIDropdownViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(data.count, Int(view.bounds.height / cellHeight))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < data.count else {
            return UITableViewCell()
        }
        
        let cell: UIDropdownCell = tableView.dequeueReusableCell(for: indexPath)
        let title = data[indexPath.row]
        
        cell.setTitle(with: title)
        
        return cell
    }
}

extension UIDropdownViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.dropdown(dropdown, didSelectRowAt: indexPath)
        
        guard indexPath.row < data.count else {
            return
        }
        
        let title = data[indexPath.row]
        
        inputField.text = title
        dropdown.isHidden = true
    }
}

private extension UIDropdownViewController {
    var cellHeight: CGFloat {
        return delegate?.cellHeight ?? 50
    }
}
