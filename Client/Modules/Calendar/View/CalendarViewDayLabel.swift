//
//  CalendarViewDayLabel.swift
//  Client
//
//  Created by Ampe on 9/18/18.
//  Copyright © 2018 educrate. All rights reserved.
//

import UIKit

class CalendarViewDayLabel: UIView {
    
    
    // MARK: Views
    
    /// stack view containing
    /// the title label and the detail label
    /// title label to remain on top of the detail label
    private weak var stackView: UIStackView!
    
    /// label displaying the top information
    /// typically this will be the day of the month
    /// example - 2,12,24,31
    private weak var titleLabel: UILabel!
    
    /// label displaying lower information
    /// typically this will be the day of the week
    /// example - mon,tue,wed,thu,fri,sat,sun
    private weak var detailLabel: UILabel!
    
    
    // MARK: Initializers
    
    /// programmatic initializer
    ///
    /// - Parameter frame: frame of the view
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let sv = UIStackView()
        stackView = sv
        
        initializeViews()
    }
    

    /// required storyboard initialzer
    ///
    /// - Parameter aDecoder: internal apple property
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tl = UILabel()
        titleLabel = tl
        
        let dl = UILabel()
        detailLabel = dl
        
        let sv = UIStackView()
        stackView = sv
        
        initializeViews()
    }
}


// MARK: - Public Interface

extension CalendarViewDayLabel {
    
    /// setup method for setting properties on the view
    ///
    /// - Parameter viewModel: model holding view formatted data
    func setUp(_ date: CalendarDate) {
        titleLabel.text = String(date.day)
        detailLabel.text = date.shortDayDescription
    }
}


// MARK: - Private Setup Methods

private extension CalendarViewDayLabel {
    func initializeViews() {
        addViews()
        setUpStackView()
        addConstraints()
    }
    
    func addViews() {
        addSubview(stackView)
    }
    
    func setUpStackView() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
    }
    
    func addConstraints() {
        stackView.leftAnchor.constraint(equalTo: leftAnchor)
        stackView.rightAnchor.constraint(equalTo: rightAnchor)
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        stackView.topAnchor.constraint(equalTo: topAnchor)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
