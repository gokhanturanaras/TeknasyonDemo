//
//  MainViewController.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit

class MainViewController: BaseViewController {

    private var viewSource:MainView{
        return self.view as! MainView
    }
    
    private var viewModel = MainViewModel()
    
    override func loadView() {
       view = MainView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDidLoad()
        viewModelObserver()
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPopularsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "content", for: indexPath) as! MainTableViewCell
        guard let product = viewModel.getPopular(at: indexPath.row) else {return UITableViewCell()}
        cell.configuration(data: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.getPopularsCount() - 1) {
            viewModel.getPopularData(page: viewModel.getNextPage())
        }
    }
 
}
extension MainViewController {
    func setupUI(){
        viewSource.tableView.delegate = self
        viewSource.tableView.dataSource = self
    }
    
    func viewModelObserver() {
        viewModel.productDataObserver = { [weak self] in
            guard let self = self else {return}
            self.viewSource.relaodData()
        }
    }
}
