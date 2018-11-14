//
//  XIBView.swift
//  Client
//
//  Created by Ampe on 11/13/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class XIBView: UIView {
    private weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
}

private extension XIBView {
    func setUp() {
        create()
        style()
        constrain()
    }
}

private extension XIBView {
    func create() {
        view = instantiateXIB()
        addSubview(view)
    }
    
    func style() {
        view.backgroundColor = .white
    }
    
    func constrain() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}

// MARK: View Instantiation from XIB
private extension XIBView {
    func instantiateXIB<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName))")
        }
        
        return view
    }
}

