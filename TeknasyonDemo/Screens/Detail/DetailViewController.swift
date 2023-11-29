//
//  DetailViewController.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit

class DetailViewController: UIViewController {
    private var viewSource:DetailView{
        return self.view as! DetailView
    }
    
    var viewModel = DetailViewModel()
    
    override func loadView() {
       view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = viewModel.popularData{
            viewSource.setData(data: data)
        }
        // Do any additional setup after loading the view.
    }
    

}
