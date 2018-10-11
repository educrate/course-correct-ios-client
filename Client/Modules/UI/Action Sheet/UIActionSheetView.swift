//
//  UIActionSheet.swift
//  UIActionSheet
//
//  Created by Ampe on 7/31/18.
//

import UIKit

@IBDesignable
class UIActionSheetView: UIView {
    
    // MARK: Views
    private weak var tableView: UITableView!
    
    // MARK: Properties
    private weak var tableViewHeightConstraint: NSLayoutConstraint!
   private  weak var tableViewTopConstraint: NSLayoutConstraint!
    
    // MARK: Properties
    private var actions: [UIActionSheetAction] = []
    
    // MARK: IBInspectables
    @IBInspectable
    var cellHeight: CGFloat = UIActionSheetConfig.default.cellHeight {
        didSet {
            animateTableView(tableViewHeightConstraint,
                             value: tableViewHeight(),
                             for: animationDuration,
                             with: .to)
        }
    }
    
    @IBInspectable
    var backgroundViewColor: UIColor = UIActionSheetConfig.default.backgroundColor {
        didSet {
            layer.backgroundColor = backgroundViewColor.cgColor
        }
    }
    
    @IBInspectable
    var backgroundAlphaValue: CGFloat = UIActionSheetConfig.default.backgroundAlphaValue {
        didSet {
            guard backgroundAlphaValue >= 0 && backgroundAlphaValue <= 1 else {
                assert(false, "select a value between 0 and 1")
                return
            }
            
            animateBackgroundAlpha(for: animationDuration, value: backgroundAlphaValue)
        }
    }
    
    @IBInspectable
    var animationDuration: Double = UIActionSheetConfig.default.animationDuration
    
    @IBInspectable
    var shouldShowDropShadow: Bool = UIActionSheetConfig.default.shouldShowDropShadow {
        didSet {
            guard shouldShowDropShadow else {
                return
            }
            
            tableView.layer.shadowColor = dropShadowColor.cgColor
            tableView.layer.shadowOffset = dropShadowOffset
            tableView.layer.shadowRadius = dropShadowRadius
            tableView.layer.shadowOpacity = dropShadowOpacity
            tableView.layer.masksToBounds = false
        }
    }
    
    @IBInspectable
    var dropShadowColor: UIColor = UIActionSheetConfig.default.dropShadowConfig.color {
        didSet {
            tableView.layer.shadowColor = dropShadowColor.cgColor
        }
    }
    
    @IBInspectable
    var dropShadowOffset: CGSize = UIActionSheetConfig.default.dropShadowConfig.offset {
        didSet {
            tableView.layer.shadowOffset = dropShadowOffset
        }
    }
    
    @IBInspectable
    var dropShadowRadius: CGFloat = UIActionSheetConfig.default.dropShadowConfig.radius {
        didSet {
            tableView.layer.shadowRadius = dropShadowRadius
        }
    }
    
    @IBInspectable
    var dropShadowOpacity: Float = UIActionSheetConfig.default.dropShadowConfig.opacity {
        didSet {
            tableView.layer.shadowOpacity = dropShadowOpacity
        }
    }
    
    // MARK: Designable Initalizers
    convenience init(config: UIActionSheetConfig = .default) {
        self.init(UIScreen.main.bounds,
                  config: config)
    }
    
    override convenience init(frame: CGRect) {
        self.init(frame)
    }
    
    // MARK: Programmatic Initalizer
    init(_ frame: CGRect,
                config: UIActionSheetConfig = .default) {
        
        super.init(frame: frame)
    }
    
    // MARK: Storyboard Initalizer
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Setup Methods
private extension UIActionSheetView {
    func addViews() {
        addSubview(tableView)
    }
    
    func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        let tableViewHeightAnchor = tableView.heightAnchor.constraint(equalToConstant: tableViewHeight())
        tableViewHeightAnchor.isActive = true

        tableViewHeightConstraint = tableViewHeightAnchor
        
        let tableViewTopAnchor = tableView.topAnchor.constraint(equalTo: bottomAnchor)
        tableViewTopAnchor.isActive = true
        
        tableViewTopConstraint = tableViewTopAnchor
    }
    
    func setupView() {
        layer.backgroundColor = backgroundViewColor.withAlphaComponent(backgroundAlphaValue).cgColor
    }
    
    func setupTableView() {
        
        tableView.register(UIActionSheetCell.self,
                           forCellReuseIdentifier: UIActionSheetCell.reuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
    }
    
    func initConfig(_ config: UIActionSheetConfig = .default) {
        cellHeight = config.cellHeight
        backgroundAlphaValue = config.backgroundAlphaValue
        shouldShowDropShadow = config.shouldShowDropShadow
        animationDuration = config.animationDuration
        
        dropShadowColor = config.dropShadowConfig.color
        dropShadowOffset = config.dropShadowConfig.offset
        dropShadowRadius = config.dropShadowConfig.radius
        dropShadowOpacity = config.dropShadowConfig.opacity
    }
}

// MARK: - Public Methods
extension UIActionSheetView {
    func show() {
        let tableView = UITableView()
        self.tableView = tableView
        
        addViews()
        addConstraints()
        
        setupView()
        setupTableView()
        
        guard let keyWindow = UIApplication.shared.keyWindow else {
            assert(false, "no key window for application")
            return
        }
        
        keyWindow.addSubview(self)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
        layoutIfNeeded()
        layer.backgroundColor = backgroundViewColor.withAlphaComponent(0).cgColor
        animateTableView(tableViewTopConstraint, value: -tableViewHeight(), for: animationDuration, with: .to)
        animateBackgroundAlpha(for: animationDuration, value: backgroundAlphaValue)
        CATransaction.commit()
    }
    
    func hide() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration/2)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear))
        CATransaction.setCompletionBlock { self.removeFromSuperview() }
        layer.backgroundColor = backgroundViewColor.withAlphaComponent(backgroundAlphaValue).cgColor
        animateTableView(tableViewTopConstraint, value: 0, for: animationDuration/2, with: .to)
        animateBackgroundAlpha(for: animationDuration/2, value: 0)
        CATransaction.commit()
    }
}

// MARK: - Animation Methods
private extension UIActionSheetView {
    enum AnimationType {
        case add
        case to
    }
    
    func animateTableView(_ constraint: NSLayoutConstraint,
                          value: CGFloat,
                          for duration: TimeInterval,
                          with type: AnimationType) {
        
        switch type {
        case .add:
            constraint.constant += value
        case .to:
            constraint.constant = value
        }
        
        UIView.animate(withDuration: duration) {
            self.layoutIfNeeded()
        }
    }
    
    func animateBackgroundAlpha(for duration: TimeInterval,
                                value: CGFloat) {
        
        UIView.animate(withDuration: duration) {
            self.layer.backgroundColor = self.backgroundViewColor.withAlphaComponent(value).cgColor
        }
    }
}

// MARK: - UI Action Sheet Data Source Conformance
extension UIActionSheetView: UIActionSheetDataSource {
    func addAction(_ action: UIActionSheetAction) {
        actions.append(action)
    }
    
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

// MARK: - Table View Delegate Conformance
extension UIActionSheetView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
        
        guard let action = action(for: indexPath) else {
            assert(false, "inconsistency - file a bug")
            return
        }
        
        guard let handler = action.handler else {
            assert(false, "inconsistency - file a bug")
            return
        }
        
        switch action.style {
        case .dismiss:
            hide()
        }
        
        handler(action)
    }
    
    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellHeight
    }
}

// MARK: - Table View Data Source Conformance
extension UIActionSheetView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        return actions.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UIActionSheetCell.reuseIdentifier,
                                                       for: indexPath) as? UIActionSheetCell else {
                                                        
            assert(false, "table view cell registration inconsistency")
            return UITableViewCell()
        }
        
        guard let title = action(for: indexPath)?.title else {
            assert(false, "inconsistency - file a bug")
            return UITableViewCell()
        }
        
        cell.update(title)
        return cell
    }
}
