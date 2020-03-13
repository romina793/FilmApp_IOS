//
//  FilmService.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class FilmService: FilmServiceContract {
    
    let BASE_URL = "https://api.themoviedb.org/3/"
    let MOVIE_POPULAR = "movie/popular?"
    let API_KEY = "api_key=208ca80d1e219453796a7f9792d16776"
    let LENGUAGE = "&language=en-US"
    let PAGE = "&page=1"
    let BASE_URL_IMAGE = "https://image.tmdb.org/t/p/"
    
    
    func getFilm(complete: @escaping (FilmModel) -> (), fail: @escaping () -> ()) {
        guard let url = URL(string:
            "\(BASE_URL)\(MOVIE_POPULAR)\(API_KEY)\(LENGUAGE)\(PAGE)")
            else {
                return
        }
        
        Alamofire.request(url,
                          method: .get,
                          parameters: ["Content-Type" : "application/json"])
            
            .validate()
            .responseJSON { response in
                
                let model = FilmModel(withParams: response.result.value!)
                complete(model)
                
        }
        
    }
    
    func retrieveImage(url: String, size: String, complete: @escaping (UIImage) -> (), fail: @escaping () -> ()) {
        let urlComplete: String = "\(BASE_URL_IMAGE)\(size)\(url)"
        Alamofire.request(urlComplete).responseImage { response in
            if response.result.value != nil {
                let image = UIImage(data: response.data!, scale: 1.0)!
                complete(image)
            }
        }
        
    }
    
}
    
    
    

    




