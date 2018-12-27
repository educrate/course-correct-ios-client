//
//  TutorProfileRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfileRouter: TutorProfileWireframeProtocol {
    weak var viewController: UIViewController?
    weak var delegate: TutorProfileDelegate?
}

extension TutorProfileRouter {
    func completed(with tutor: String) {
        delegate?.didSelect(tutor)
    }
}
