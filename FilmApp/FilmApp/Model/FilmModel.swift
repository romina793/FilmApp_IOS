//
//  FilmModel.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import SwiftyJSON

class FilmModel: NSObject {
    
    var films = [FilmModelArray]()
    
    init(withParams params: Any) {
        
        if let data = params as? [String: Any] {
            
            if let filmsArray = data["results"] as? [[String: Any]]  {
                
                for film in filmsArray {
                    let filmModel = FilmModelArray(withParams : film)
                    films.append(filmModel)
                }
            }
            
        }
        
        
    }
    
}

class FilmModelArray: NSObject {
    
    var title: String
    var image: String
    var overview: String
    var backColor: String
    var genres: String?

    
    
    init(withParams params: [String: Any]){
        self.title = params ["title"] as? String ?? ""
        self.overview = params ["overview"] as? String ?? ""
        self.image = params["poster_path"] as! String
        self.backColor = params["backdrop_path"] as! String
        self.genres = params["genres"] as? String ?? ""
        
    
    }

}

