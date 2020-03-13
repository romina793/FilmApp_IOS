//
//  CellFilm.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import UIKit

class CellFilm: UITableViewCell {
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var imageBackColor: UIImageView!
    
    
    
    static var identifier : String {
        return String(describing: self)
    }
    
    static var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
