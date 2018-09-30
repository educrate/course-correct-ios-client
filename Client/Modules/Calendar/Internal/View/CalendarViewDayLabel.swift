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
    
    /// Setup method for setting properties on the view.
    ///
    /// - Parameter viewModel: model holding view formatted data
    func setUp(title: String,
               detail: String) {
        
        titleLabel.text = title
        detailLabel.text = detail
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
        stackView.distribution = .equalCentering
        stackView.spacing = 0
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
    }
    
    func addConstraints() {
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}
