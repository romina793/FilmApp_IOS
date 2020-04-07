//
//  FilmViewModelContract.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

protocol  FilmViewModelContract {
    
//    CALL SERVICE
    func retriveFilms()
    func retriveImageFilms(index: Int)
    func retrivePosterFilms(index: Int)

//    GET DATA
    func getListFilmsCount() -> Int
    func getTitleFilm(index: Int) -> String
    func getDescriptionFilm (index: Int) -> String
    func getImageFilm(index: Int) -> UIImage?
    func getPosterFilm(index: Int) -> UIImage?
    func getGenre (index: Int) ->  String

}

protocol  FilmViewModelUpdate {
    func reloadData()
    func showLoading()
    func showError()
}
