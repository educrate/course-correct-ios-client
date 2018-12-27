//
//  TutorListRouter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListRouter: TutorListWireframeProtocol {
    weak var viewController: UIViewController?
}

extension TutorListRouter {
    func presentTutorProfile(_ delegate: TutorProfileDelegate?) {
        viewController?.show(TutorProfileBuilder().create(delegate), sender: nil)
    }
}
