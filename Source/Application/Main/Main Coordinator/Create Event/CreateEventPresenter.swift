//
//  CreateEventPresenter.swift
//  Client
//
//  Created Ampe on 10/20/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class CreateEventPresenter: CreateEventPresenterProtocol {
    var router: CreateEventWireframeProtocol?
    var interactor: CreateEventInteractorProtocol?
    weak var view: CreateEventViewProtocol?
    weak var delegate: CreateEventDelegate?
}

extension CreateEventPresenter {
    func pressedAddLocation(_ delegate: AddLocationDelegate?) {
        router?.showAddLocation(delegate)
    }
    
    func pressedSelectTutor(_ delegate: TutorListDelegate?) {
        router?.showSelectTutor(delegate)
    }
    
    func locationAdded() {
        router?.unwind()
    }
    
    func tutorSelected() {
        router?.unwind()
    }
    
    func eventCreated() {
        delegate?.didCreateEvent("")
    }
}
