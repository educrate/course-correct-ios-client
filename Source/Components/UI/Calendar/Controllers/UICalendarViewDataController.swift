//
//  UICalendarViewDataController.swift
//  Client
//
//  Created by Ampe on 11/21/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import Foundation

class UICalendarViewDataController {
    var delegate: UICalendarViewDataControllerDelegate?
    
    private let earliestAvailableYear: Int = 2018
    private let latestAvailableYear: Int = 2019
    private let helper: UICalendarViewHelper
    private let cache: UICalendarViewDataHelperDictionary
    
    private var loadedSections: ClosedRange<Int> = 0...0
    
    init(calendar: Calendar,
         cache: UICalendarViewDataHelperDictionary = UICalendarViewDataHelperDictionary()) {
        
        self.helper = UICalendarViewHelper(calendar: calendar)
        self.cache = cache
    }
}

extension UICalendarViewDataController: UICalendarViewDateDataSource {
    func numberOfMonths() -> Int {
        return months(from: earliestAvailableYear,
                      to: latestAvailableYear)
    }
    
    func numberOfDays(in section: Int) -> Int {
        guard loadedSections.contains(section) else {
            return 0
        }
        
        let components = monthComponents(section + 1)
        
        return helper.days(month: components.month,
                           year: components.year)
    }
    
    func components(for indexPath: IndexPath) -> UICalendarViewDateComponents {
        let components = monthComponents(indexPath.section + 1)
        return UICalendarViewDateComponents(day: indexPath.row + 1,
                                            month: components.month,
                                            year: components.year)
    }
    
    func descriptions(for components: UICalendarViewDateComponents) -> UICalendarViewDateDescription? {
        return helper.dateDescription(from: components)
    }
}

private extension UICalendarViewDataController {
    func months(from startYear: Int, to endYear: Int) -> Int {
        return (endYear - startYear + 1) * 12
    }
    
    func monthComponents(_ monthCount: Int) -> (year: Int, month: Int) {
        let extraYears = (monthCount - 1) / 12
        let year = earliestAvailableYear + extraYears
        let month = ((monthCount - 1) % 12) + 1
        
        return (year: year, month: month)
    }
}

extension UICalendarViewDataController: UICalendarViewDateDelegate {
    func willDisplay(_ section: Int) {
        let previousRange = loadedSections
        let newRange = (max(0, section - 1))...(section + 1)
        
        loadedSections = newRange
        
        var sectionsToExpand: [Int] = []
        var sectionsToCollapse: [Int] = []
        
        // discard lower bound objects
        // behavior is scrolling to the future
        if previousRange.lowerBound < newRange.lowerBound {
            sectionsToCollapse.append(contentsOf: previousRange.lowerBound...(newRange.lowerBound - 1))
        }
        
        // discard upper bound objects
        // behavior is scrolling to the past
        if newRange.upperBound < previousRange.upperBound {
            sectionsToCollapse.append(contentsOf: (newRange.upperBound + 1)...previousRange.upperBound)
        }
        
        // expand lower bound objects
        // behavior is scrolling to the past
        if newRange.lowerBound < previousRange.lowerBound {
            sectionsToExpand.append(contentsOf: newRange.lowerBound...(previousRange.lowerBound - 1))
        }
        
        // expand upper bound objects
        // behavior is scrolling to the future
        if previousRange.upperBound < newRange.upperBound {
            sectionsToExpand.append(contentsOf: (previousRange.lowerBound + 1)...newRange.upperBound)
        }
        
        delegate?.reload(IndexSet(sectionsToExpand + sectionsToCollapse))
        
//        if !sectionsToExpand.isEmpty {
//            var indexPaths: [IndexPath] = []
//
//            for section in sectionsToExpand {
//                guard section > 0 else {
//                    continue
//                }
//
//                for row in 0...numberOfDays(in: section) - 1 {
//                    indexPaths.append(IndexPath(row: row, section: section))
//                }
//            }
//
//            guard !indexPaths.isEmpty else {
//                return
//            }
//
//            delegate?.insert(indexPaths)
//        }
//
//        if !sectionsToCollapse.isEmpty {
//            var indexPaths: [IndexPath] = []
//
//            for section in sectionsToCollapse {
//                for row in 0...numberOfDays(in: section) {
//                    indexPaths.append(IndexPath(row: row, section: section))
//                }
//            }
//
//            guard !indexPaths.isEmpty else {
//                return
//            }
//
//            delegate?.remove(indexPaths)
//        }
    }
}
