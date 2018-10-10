//
//  UIDropdownDelegate.swift
//  UIDropdown
//
//  Created by Ampe on 7/30/18.
//

import Foundation

protocol UIDropdownDelegate {
    func didBeginEditing(_ sender: UIField)
    func textDidChange(_ sender: UIField)
    func didEndEditing(_ sender: UIField)
    func didSelectRow(_ at: IndexPath, _ sender: UIDropdownView)
}

extension UIDropdownDelegate {
    func didBeginEditing(_ sender: UIField) {}
    func textDidChange(_ sender: UIField) {}
    func didEndEditing(_ sender: UIField) {}
    func didSelectRow(_ at: IndexPath, _ sender: UIDropdownView) {}
}
