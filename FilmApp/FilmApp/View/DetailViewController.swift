//
//  DetailViewController.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import UIKit
import AlamofireImage


class DetailViewController: UIViewController {
    
    @IBOutlet var viewColor: UIView!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageColor: UIImageView!
    

    var viewModel: FilmDetailViewModelContract?

    
    override func viewDidLoad() {
        self.setConfigurationText()
    }
    
    func setConfigurationText() {
        self.imagePoster.image = self.viewModel?.getImageFilm()
        self.labelTitle.text = self.viewModel?.getTitleFilm()
        self.labelDescription.text = self.viewModel?.getDescriptionFilm()
    }
    
//    func changeColor(){
//        let gradientView = ComplimentaryGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//
//        //Colors for gradient are derived from the provided image
//        gradientView.image = UIImage(named: "film")
//
//        gradientView.gradientTpye = .colors(start: .primary, end: .secondary)
//
//        // Default = `.left`
//        gradientView.gradientStartPoint = .top
//
//        // Default = `.high`
//        gradientView.quality = .high
//    }
    
    
}
    


extension DetailViewController: FilmDetailViewModelUpdate {
    
    
    func showLoading() {
//        self.loading()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "¡Ups! Hubo un error, por favor intenta más tarde.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
        return;    }
    
}
