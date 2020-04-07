//
//  FilmDetailViewModelContract.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

protocol  FilmDetailViewModelContract {
    
    //  SET DATA
    func setTitleFilm(titleFilm: String)
    func setDescriptionFilm(descriptionFilm: String)
    func setImageFilm(imageFilm: UIImage)
    
    
    //  GET DATA
    func getTitleFilm () -> String
    func getDescriptionFilm() -> String
    func getImageFilm() -> UIImage
    
    
}

protocol  FilmDetailViewModelUpdate {
    func showLoading()
    func showError()
}
