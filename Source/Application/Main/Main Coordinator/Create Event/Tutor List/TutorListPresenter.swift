//
//  TutorListPresenter.swift
//  Client
//
//  Created by Christian Ampe on 10/14/18.
//  Copyright © 2018 Educrate. All rights reserved.
//

import UIKit

class TutorListPresenter: TutorListPresenterProtocol {
    var router: TutorListWireframeProtocol?
    var interactor: TutorListInteractorProtocol?
    weak var view: TutorListViewProtocol?
    weak var delegate: TutorListDelegate?
}

extension TutorListPresenter {
   func showTutorProfile(at indexPath: IndexPath, _ delegate: TutorProfileDelegate?) {
        router?.presentTutorProfile(delegate)
    }
    
    func didSelectTutor(_ tutor: String) {
        delegate?.didSelectTutor(tutor)
    }
}
