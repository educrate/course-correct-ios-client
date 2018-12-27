//
//  TutorProfilePresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorProfilePresenter: TutorProfilePresenterProtocol {
    var interactor: TutorProfileInteractorProtocol?
    var router: TutorProfileWireframeProtocol?
    weak var view: TutorProfileViewProtocol?
    weak var delegate: TutorProfileDelegate?
}

extension TutorProfilePresenter {
    func tutorSelected(_ tutor: String) {
        router?.completed(with: tutor)
    }
}
