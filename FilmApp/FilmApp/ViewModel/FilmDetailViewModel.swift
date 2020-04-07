//
//  FilmDetailViewModel.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import AlamofireImage


class FilmDetailViewModel: NSObject, FilmDetailViewModelContract {
    
    var titleFilm: String?
    var descriptionFilm: String?
    var imagePoster: UIImage?
    var view: FilmDetailViewModelUpdate?
    
    
    required init(view: FilmDetailViewModelUpdate)  {
        self.view = view
    }
    
    
    //  SET DATA
    
    func setTitleFilm(titleFilm: String){
        self.titleFilm = titleFilm
    }
    
    func setDescriptionFilm(descriptionFilm: String) {
        self.descriptionFilm = descriptionFilm
    }
    
    func setImageFilm(imageFilm: UIImage){
        self.imagePoster = imageFilm
    }
    
    
    
    //  GET DATA
    
    func getTitleFilm () -> String  {
        return self.titleFilm ?? ""
    }
    
    func getDescriptionFilm() -> String  {
        return self.descriptionFilm ?? ""
    }
    
    
    func getImageFilm() -> UIImage{
        return self.imagePoster ?? UIImage()
    }
    
    
}

        


