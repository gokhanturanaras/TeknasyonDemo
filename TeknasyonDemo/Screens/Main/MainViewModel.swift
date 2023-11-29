//
//  MainViewModel.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation

class MainViewModel: BaseViewModel {
    //Variables
    private var popularResponse:PopularResponse?
    private var popularList:[Popular]?
    private var currentPage:Int = 1
    
    //Observers
    var productDataObserver: (() -> ())?

    override func viewDidLoad() {
        getPopularData(page: currentPage)
    }
    
    //Functions
    func getPopularData(page: Int){
        if let page = popularResponse?.page ,let totalPage = popularResponse?.totalPages, page == totalPage {
            return
        }
        APIClient.popular(language:Constants.shared.language, page: page) { [weak self] response in
            guard let self = self else { return }
            switch response{
            case .success(let value):
                self.popularResponse = value
                if popularList == nil {
                    self.popularList = value.results
                } else {
                    guard let populars = value.results else { return }
                    self.popularList?.append(contentsOf: populars)
                }
                self.productDataObserver?()
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func getPopularsCount() -> Int{
        popularList?.count ?? 0
    }
    
    func getPopular(at row: Int) -> Popular?{
        popularList?[row]
    }
    
    func getNextPage() -> Int{
       currentPage = (popularResponse?.page ?? 0) + 1
       return currentPage
    }
}
