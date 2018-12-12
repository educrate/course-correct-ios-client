//
//  TutorListPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListPresenter: TutorListPresenterProtocol {
    weak private var view: TutorListViewProtocol?
    var interactor: TutorListInteractorProtocol?
    private let router: TutorListWireframeProtocol

    // MARK: - Initializer
    init(interface: TutorListViewProtocol,
         interactor: TutorListInteractorProtocol?,
         router: TutorListWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension TutorListPresenter {
   func showTutorProfile(at indexPath: IndexPath, _ delegate: TutorProfileDelegate?) {
        router.presentTutorProfile(delegate)
    }
    
    func didSelectTutor(_ tutor: String) {
        router.completed(with: tutor)
    }
}
