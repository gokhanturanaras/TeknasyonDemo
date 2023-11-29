//
//  MainView.swift
//  TeknasyonDemo
//
//  Created by Gökhan Aras on 29.11.2023.
//

import Foundation
import UIKit

class MainView: BaseView {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "content")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .background
        draw()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func relaodData(){
        tableView.reloadData()
    }
}

extension MainView {
    func draw(){
        addSubview(tableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),

        ])
      
    }
    
}
