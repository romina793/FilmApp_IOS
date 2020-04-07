//
//  ViewController.swift
//  FilmApp
//
//  Created by rpozzuto on 13/03/2020.
//  Copyright © 2020 rpozzuto. All rights reserved.
//

import UIKit
import AlamofireImage


class ViewController: UIViewController {
    
    var viewModel: FilmViewModelContract?
    var titleFilm = ""
    var imageFilm = UIImage()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = FilmViewModel(view: self)
        self.setConfigurationTableView()
        self.viewModel?.retriveFilms()
//        self.loading()
    }
    
    func loading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }

    
    func setConfigurationTableView() {
        tableView.register(CellFilm.nib, forCellReuseIdentifier: CellFilm.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.cellLayoutMarginsFollowReadableWidth =  true
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let controller = segue.destination as? DetailViewController {
            controller.viewModel = FilmDetailViewModel(view: controller)
            if let indexPath = tableView.indexPathForSelectedRow{
                 
                controller.viewModel?.setTitleFilm(titleFilm: viewModel?.getTitleFilm(index: indexPath.row) ?? "")
                
                controller.viewModel?.setDescriptionFilm(descriptionFilm: viewModel?.getDescriptionFilm(index: indexPath.row) ?? "")
                
                controller.viewModel?.setImageFilm(imageFilm: viewModel?.getImageFilm(index: indexPath.row) ?? UIImage())
            }

        }
    }
}
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getListFilmsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellFilm.identifier) as? CellFilm
        
        self.viewModel?.retrivePosterFilms(index: indexPath.row)
        self.viewModel?.retriveImageFilms(index: indexPath.row)

        //Set configuration cell
        cell?.labelTitle?.text = viewModel!.getTitleFilm(index: indexPath.row)
        cell?.imageBackColor?.image = viewModel!.getPosterFilm(index: indexPath.row)
        
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "goToDetailSegue", sender: ["indexPath": indexPath])
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

   
extension ViewController: FilmViewModelUpdate {

    func reloadData() {
        self.tableView.reloadData()
    }
    
    func showLoading() {
        self.loading()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "¡Ups! Hubo un error, por favor intenta más tarde.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
        return;       }

}


