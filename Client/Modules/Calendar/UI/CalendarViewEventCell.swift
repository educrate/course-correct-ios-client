//
//  CalendarViewEventCell.swift
//  FlatCalendar
//
//  Created by Ampe on 9/11/18.
//

import UIKit

class CalendarViewEventCell: UITableViewCell {
    
    
    // MARK: Views
    
    private weak var titleLabel: UILabel!
    private weak var detailLabel: UILabel!
    private weak var leftIconImageView: UIImageView!
    private weak var rightIconImageView: UIImageView!
    
    
    // MARK: Initializers
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let lv = UIImageView()
        leftIconImageView = lv
        
        let rv = UIImageView()
        rightIconImageView = rv
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let lv = UIImageView()
        leftIconImageView = lv
        
        let rv = UIImageView()
        rightIconImageView = rv
    }
}

