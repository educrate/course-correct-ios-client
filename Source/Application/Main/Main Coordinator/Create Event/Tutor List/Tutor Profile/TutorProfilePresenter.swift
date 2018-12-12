//
//  TutorProfilePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfilePresenter: TutorProfilePresenterProtocol {
    weak private var view: TutorProfileViewProtocol?
    var interactor: TutorProfileInteractorProtocol?
    private let router: TutorProfileWireframeProtocol

    init(interface: TutorProfileViewProtocol,
         interactor: TutorProfileInteractorProtocol?,
         router: TutorProfileWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension TutorProfilePresenter {
    func tutorSelected(_ tutor: String) {
        router.completed(with: tutor)
    }
}
