//
//  MainViewModel.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation
import RxSwift
import RxRelay

class MainViewModel: BaseViewModel {
    //Variables
    private var popularResponse:PopularResponse?
    private var popularList:[Popular]?
    private var currentPage:Int = 1
    //Observers
    var popularDataObserver: (() -> ())?

    override func viewDidLoad() {
        getPopularData(page: currentPage)
    }
    private let disposeBag = DisposeBag()
    var dataSource = BehaviorRelay<[Popular]>(value: [])

    //Functions
    func getPopularData(page: Int){
        if let page = popularResponse?.page ,let totalPage = popularResponse?.totalPages, page == totalPage {
            return
        }
        APIClient.popular(language:Constants.shared.language, page: page)
               .observe(on: MainScheduler.instance)
               .subscribe(onNext: { [weak self] value in
                   guard let self = self else { return }
                   self.popularResponse = value
                   if self.popularList == nil {
                       self.popularList = value.results
                   } else {
                       guard let populars = value.results else { return }
                       self.popularList?.append(contentsOf: populars)
                   }
                   self.dataSource.accept(self.popularList ?? [])
                   self.popularDataObserver?()
               }, onError: { error in
                   print("Unknown error:", error)

               })
               .disposed(by: disposeBag)
       
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
