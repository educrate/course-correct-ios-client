//
//  UIDropdown.swift
//  UIDropdown
//
//  Created by Ampe on 7/30/18.
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
}

extension UIDropdownViewController {
    func setDropdown(_ newData: [String]) {
        data = newData
        dropdown.reloadData()
        dropdown.isHidden = false
    }
}

extension UIDropdownViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(view.bounds.height / cellHeight)
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
        guard let delegate = delegate else {
            return 50
        }
        
        return delegate.cellHeight
    }
}
