//
//  FilmServiceContract.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import Foundation
import AlamofireImage

protocol FilmServiceContract {
    
    func getFilm(complete: @escaping (FilmModel) -> (), fail: @escaping () -> ())
    func retrieveImage(url: String, size: String, complete: @escaping (UIImage) -> (), fail: @escaping () -> ())
    
}
