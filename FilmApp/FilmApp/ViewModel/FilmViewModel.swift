//
//  FilmViewModel.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import AlamofireImage

class FilmViewModel: NSObject, FilmViewModelContract {
    
    
    
    var view : FilmViewModelUpdate
    var model : FilmModel?
    var service: FilmServiceContract
    var titleFilm: String?
    var genre: String?
    
    
    let SIZE_POSTER: String = "original"
    let SIZE_IMAGE: String = "w500"
    
    var imageArray: [UIImage] = []
    var backColorArray: [UIImage] = []
    
    
    required init(view: FilmViewModelUpdate) {
        self.view = view
        self.service = FilmService()
    }
    
    //  CALL SERVICE
    
    func retriveFilms(){
        self.view.showLoading()
        self.imageArray.removeAll()
        service.getFilm(complete: { (model) in
            self.model = model
            self.view.reloadData()
            
        }) {
            self.view.showError()
        }
        
    }
    
    
    func retriveImageFilms(index: Int){
        self.service.retrieveImage(url: self.getImageFilmString(index: index),size: SIZE_POSTER, complete: { (image) in
            self.imageArray.append(image)
            self.view.reloadData()
        }) {
            self.view.showError()
        }
        
    }
    
    func retrivePosterFilms(index: Int){
        self.service.retrieveImage(url: self.getPosterFilmString(index: index),size: SIZE_IMAGE, complete: { (color) in
            self.backColorArray.append(color)
            //                self.view.reloadData()
            
        }) {
            self.view.showError()
        }
//        self.retriveImageFilms(index: index)
    }
    
    
    //  GET DATA
    func getListFilmsCount() -> Int {
        return self.model?.films.count ?? 0
    }
    
    
    func getTitleFilm (index: Int) -> String  {
        return self.model?.films[index].title.description ?? ""
    }
    
    func getImageFilmString (index: Int) ->  String {
        return (self.model?.films[index].image) ?? ""
    }
    
    
    func getPosterFilmString (index: Int) ->  String {
        return (self.model?.films[index].backColor) ?? ""
    }
    
    func getGenre (index: Int) ->  String {
        return (self.model?.films[index].genres) ?? ""
    }
    
    func getDescriptionFilm (index: Int) -> String  {
        return self.model?.films[index].overview.description ?? ""
    }
    
    func getImageFilm(index: Int) -> UIImage? {
        if imageArray.count > 0 {
            return self.imageArray[index]
        } else {
            return UIImage(named: "film")
        }
    }
    
    func getPosterFilm(index: Int) -> UIImage? {
        if backColorArray.count > 0 {
            return self.backColorArray[index]
        } else {
            return UIImage(named: "film")
        }
    }

    
}

