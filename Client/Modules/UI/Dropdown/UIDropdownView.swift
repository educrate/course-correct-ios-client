//
//  UIDropdown.swift
//  UIDropdown
//
//  Created by Ampe on 7/30/18.
//

import UIKit

// MARK: - Class Declaration
@IBDesignable
class UIDropdownView: UIView {
    
    // MARK: Views
    private weak var field: UIField!
    private weak var tableView: UITableView!
    
    // MARK: Storage
    var delegate: UIDropdownDelegate?
    var dataSource: UIDropdownDataSource?
    
    // MARK: Properties
    weak var flatFieldHeightConstraint: NSLayoutConstraint!
    
    // MARK: UI Field IBInspectables
    @IBInspectable
    var text: String = UIFieldConfiguration.default.text {
        didSet {
            field.text = text
        }
    }
    
    @IBInspectable
    var placeholderText: String = UIFieldConfiguration.default.placeholderText {
        didSet {
            field.placeholderText = placeholderText
        }
    }
    
    @IBInspectable
    var cursorColor: UIColor = UIFieldConfiguration.default.cursorColor {
        didSet {
            field.tintColor = cursorColor
        }
    }
    
    @IBInspectable
    var textColor: UIColor = UIFieldConfiguration.default.textColor {
        didSet {
            field.textColor = textColor
        }
    }
    
    @IBInspectable
    var placeholderColor: UIColor = UIFieldConfiguration.default.placeholderColor {
        didSet {
            field.placeholderColor = placeholderColor
        }
    }
    
    @IBInspectable
    var underlineColor: UIColor = UIFieldConfiguration.default.underlineColor {
        didSet {
            field.underlineColor = underlineColor
        }
    }
    
    @IBInspectable
    var underlineThickness: CGFloat = UIFieldConfiguration.default.underlineThickness {
        didSet {
            field.underlineHeightConstraint.constant = underlineThickness
        }
    }
    
    @IBInspectable
    var textAlignment: Int = UIFieldConfiguration.default.textAlignment.rawValue {
        didSet {
            field.textAlignment = textAlignment
        }
    }
    
    @IBInspectable
    var thicknessChange: CGFloat = UIFieldConfiguration.default.thicknessChange
    
    @IBInspectable
    var flatFieldHeight: CGFloat = UIDropdownConfig.default.flatFieldHeight {
        didSet {
            flatFieldHeightConstraint.constant = flatFieldHeight
        }
    }
    
    @IBInspectable
    var dropdownCellHeight: CGFloat = UIDropdownConfig.default.dropdownCellHeight {
        didSet {
            tableView.rowHeight = dropdownCellHeight
        }
    }
    
    // MARK: UI Dropdown IBInspectables
    @IBInspectable
    var maxNumberOfResultsPerSectionToDisplay: Int = UIDropdownConfig.default.numberOfResults {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBInspectable
    var maxNumberOfSectionsToDisplay: Int = UIDropdownConfig.default.numberOfSections {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Designable Initalizers
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override convenience init(frame: CGRect) {
        self.init(frame,
                  config: .default,
                  flatFieldConfig: .default,
                  dataSource: nil,
                  delegate: nil)
    }
    
    // MARK: Programmatic Initalizer
    public init(_ frame: CGRect,
                config: UIDropdownConfig,
                flatFieldConfig: UIFieldConfiguration,
                dataSource: UIDropdownDataSource?,
                delegate: UIDropdownDelegate?) {
        
        let flatField = UIField()
        self.field = flatField
        
        let tableView = UITableView()
        self.tableView = tableView
        
        self.dataSource = dataSource
        self.delegate = delegate
        
        super.init(frame: frame)
        
        setupUIField()
        setupTableView()
        
        addViews()
        addContraints()
        
        initConfig(config,
                   flatFieldConfig: flatFieldConfig)
    }
    
    // MARK: Storyboard Initalizer
    public required init?(coder aDecoder: NSCoder) {
        let flatField = UIField()
        self.field = flatField
        
        let tableView = UITableView()
        self.tableView = tableView
        
        super.init(coder: aDecoder)
        
        setupUIField()
        setupTableView()
        
        addViews()
        addContraints()
        
        initConfig()
    }
}

// MARK: - Public API
extension UIDropdownView {
    func reloadView() {
        tableView.reloadData()
    }
}

// MARK: - Setup Methods
private extension UIDropdownView {
    func setupUIField() {
        field.delegate = self
    }
    
    func setupTableView() {
        tableView.register(UIDropdownCell.self,
                           forCellReuseIdentifier: UIDropdownCell.reuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isScrollEnabled = false
        tableView.keyboardDismissMode = .onDrag
    }
    
    func addViews() {
        addSubview(field)
        addSubview(tableView)
    }
    
    func addContraints() {
        field.translatesAutoresizingMaskIntoConstraints = false
        field.topAnchor.constraint(equalTo: topAnchor).isActive = true
        field.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        field.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        let flatFieldHeightAnchor = field.heightAnchor.constraint(equalToConstant: flatFieldHeight)
        flatFieldHeightAnchor.isActive = true
        
        flatFieldHeightConstraint = flatFieldHeightAnchor
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: field.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func initConfig(_ config: UIDropdownConfig = .default,
                    flatFieldConfig: UIFieldConfiguration = .default) {
        
        text = flatFieldConfig.text
        placeholderText = flatFieldConfig.placeholderText
        textColor = flatFieldConfig.textColor
        placeholderColor = flatFieldConfig.placeholderColor
        underlineColor = flatFieldConfig.underlineColor
        underlineThickness = flatFieldConfig.underlineThickness
        thicknessChange = flatFieldConfig.thicknessChange
        textAlignment = flatFieldConfig.textAlignment.rawValue
    }
}

// MARK: - Helper Methods
private extension UIDropdownView {
    func hideTableView() {
        field.endEditing(true)
        tableView.isHidden = true
    }
    
    func showTableView() {
        tableView.isHidden = false
    }
}

// MARK: - UI Field Delegate Conformance
extension UIDropdownView: UIFieldDelegate {
    func editingBegan(_ sender: UIField) {
        delegate?.didBeginEditing(sender)
    }
    
    func editingEnded(_ sender: UIField) {
        hideTableView()
        delegate?.didEndEditing(sender)
    }
    
    func textChanged(_ sender: UIField) {
        if sender.text.isEmpty {
            hideTableView()
        }
        
        delegate?.textDidChange(sender)
    }
}

// MARK: - Table View Data Source Conformance
extension UIDropdownView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        guard let dataSource = dataSource else {
            return 0
        }
        
        return min(dataSource.numberOfRows(), maxNumberOfResultsPerSectionToDisplay)
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UIDropdownCell.reuseIdentifier,
                                                       for: indexPath) as? UIDropdownCell else {
            assert(false, "table view cell registration inconsistency")
            return UITableViewCell()
        }
        
        guard let dataSource = dataSource else {
            assert(false, "a data source must be provided")
            return UITableViewCell()
        }
        
        let text = dataSource.text(for: indexPath.row)
        cell.update(text)
        return cell
    }
}

// MARK: - Table View Delegate Conformance
extension UIDropdownView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        
        guard let dataSource = dataSource else {
            return
        }
        
        hideTableView()
        field.textFieldDidEndEditing()
        field.text = dataSource.text(for: indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return dropdownCellHeight
    }
}
