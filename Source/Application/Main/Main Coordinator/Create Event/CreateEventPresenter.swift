//
//  CreateEventPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventPresenter: CreateEventPresenterProtocol {
    weak private var view: CreateEventViewProtocol?
    var interactor: CreateEventInteractorProtocol?
    private let router: CreateEventWireframeProtocol

    init(interface: CreateEventViewProtocol,
         interactor: CreateEventInteractorProtocol?,
         router: CreateEventWireframeProtocol) {
        
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension CreateEventPresenter {
    func pressedAddLocation(_ delegate: AddLocationDelegate?) {
        router.showAddLocation(delegate)
    }
    
    func pressedSelectTutor(_ delegate: TutorListDelegate?) {
        router.showSelectTutor(delegate)
    }
    
    func locationAdded() {
        router.unwind()
    }
    
    func tutorSelected() {
        router.unwind()
    }
}
