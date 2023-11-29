//
//  MainViewController.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: BaseViewController {
    
    private var viewSource:MainView{
        return self.view as! MainView
    }
    
    private var viewModel = MainViewModel()
    private var disposeBag = DisposeBag()
    
    override func loadView() {
        view = MainView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Popular TV Series"
        setupUI()
        viewModel.viewDidLoad()
        viewModelObserver()
    }
    
}

extension MainViewController {
    
    
    
}
extension MainViewController {
    func setupUI(){
        viewSource.tableView.refreshControl = UIRefreshControl()
        viewModel.dataSource
            .bind(to: viewSource.tableView.rx.items(cellIdentifier: "content", cellType: MainTableViewCell.self)) { row, item, cell in
                cell.configuration(data: item)
            }
            .disposed(by: disposeBag)
        
        viewSource.tableView.refreshControl?.rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.viewModel.getPopularData(page: 1)
            })
            .disposed(by: disposeBag)
        
        viewSource.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let self = self else {return}
                guard let popular = viewModel.getPopular(at: indexPath.row) else {return }
                let detailVc = DetailViewController()
                detailVc.title = popular.name
                detailVc.viewModel.popularData = popular
                self.navigationController?.pushViewController(detailVc, animated: true)
            }).disposed(by: disposeBag)
        
        viewSource.tableView.rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] cell, indexPath in
                guard let self = self else {return}
                if indexPath.row == (self.viewModel.getPopularsCount() - 1) {
                    self.viewModel.getPopularData(page: self.viewModel.getNextPage())
                }
            })
            .disposed(by: disposeBag)
    }
    
    func viewModelObserver() {
        viewModel.popularDataObserver = { [weak self] in
            guard let self = self else {return}
            self.viewSource.relaodData()
        }
    }
}
