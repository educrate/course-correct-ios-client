//
//  UICalendarView.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class UICalendarView: XIBView {
    
    // MARK: - View Outlets
    
    /// Encompasing table view which holds
    /// the date object as well as the
    /// table view for a single day.
    @IBOutlet private weak var collectionView: UICollectionView!
    
    /// Flow layout of the collection view.
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Properties
    
    /// Controlls all internal computation
    /// necessary for setting up the calendar.
    private let controller: UICalendarViewController = .default
    
    /// Configuration of the calendar view
    /// and configurations of subviews
    private let configuration: UICalendarViewConfiguration = .default
    
    // MARK: - Internal Protocols
    
    /// Delegate for the calendar collection view.
    private weak var dateDelegate: UICalendarViewDateDelegate!
    
    /// Data source for the calendar date formatting.
    private weak var dateDataSource: UICalendarViewDateDataSource!
    
    /// Delegate for the calendar collection layout.
    private weak var layoutDelegate: UICalendarViewLayoutDelegate!
    
    // MARK: - External Protocols
    
    /// Delegate for the calendar collection.
    weak var delegate: UICalendarViewDelegate?
    
    /// Data source for the calendar collection.
    weak var dataSource: UICalendarViewDataSource?
    
    // MARK: - Initializers
    
    /// Programmatic initializer override used to set
    /// internal delegates and data sources.
    ///
    /// - Parameter frame: Frame passed by the caller.
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateDelegate = controller.dataSource
        dateDataSource = controller.dataSource
        layoutDelegate = controller.layoutDelegate
    }
    
    /// Internal storyboard initializer override used to set
    /// delegates and data sources.
    ///
    /// - Parameter aDecoder: Internal coder passed from the storyboard.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        dateDelegate = controller.dataSource
        dateDataSource = controller.dataSource
        layoutDelegate = controller.layoutDelegate
    }
}

// MARK: - View Lifecycle
extension UICalendarView {
    override func awakeFromNib() {
        super.awakeFromNib()
        registerReusableViews()
    }
}

// MARK: - Public Update Methods
extension UICalendarView {
    
    /// Scrolls the calendar to the specified date.
    ///
    /// - Parameters:
    ///   - dateComponents: Components representing the date you want to scroll to.
    ///   - animated: Flag determing whether to perform this operation animated or not.
    func move(to dateComponents: UICalendarViewDateComponents,
                animated: Bool = true) {
        
        // todo
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dateDataSource.numberOfMonths()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return dateDataSource.numberOfDays(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICalendarViewDayCell = collectionView.dequeueReusableCell(for: indexPath)
        
        cell.set(configuration.cellConfiguration)
        cell.reload()
        
        return cell
    }
}

// MARK: - Table View Data Source Conformation
extension UICalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let monthHeader: UICalendarViewMonthHeaderView = collectionView.dequeueReusableSupplementaryView(for: indexPath)
        
        let components = dateDataSource.components(for: indexPath)
        
        guard let descriptions = dateDataSource.descriptions(for: components) else {
            return monthHeader
        }
        
        monthHeader.set("\(descriptions.monthName) \(descriptions.yearValue)")
        monthHeader.reload()
        
        return monthHeader
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        dateDelegate.willDisplay(indexPath)
        
        guard let cell = cell as? UICalendarViewDayCell else {
            assertionFailure("internal inconsistency - incorrect cell type passed forward")
            return
        }
        
        let components = dateDataSource.components(for: indexPath)
        
        guard let descriptions = dateDataSource.descriptions(for: components) else {
            return
        }
        
        let date = UICalendarViewDate(components: components, descriptions: descriptions)
        
        cell.set(date)
        cell.reload()
    }
}

extension UICalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let components = dateDataSource.components(for: indexPath)
        
        guard let dataSource = dataSource else {
            return .zero
        }
        
        let eventCount = dataSource.events(for: components).count
        
        return CGSize(width: collectionView.bounds.width,
                      height: (layoutDelegate.heightForCell(eventCount)))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return configuration.cellConfiguration.interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return configuration.cellConfiguration.lineSpacing
    }
}

// MARK: - Private Helper Methods
private extension UICalendarView {
    
    /// Used to register the cells contained in the calendar collection view.
    func registerReusableViews() {
        collectionView.registerCollectionViewCell(xibCell: UICalendarViewDayCell.self)
        collectionView.registerReusableHeaderView(xibCell: UICalendarViewMonthHeaderView.self)
    }
}
